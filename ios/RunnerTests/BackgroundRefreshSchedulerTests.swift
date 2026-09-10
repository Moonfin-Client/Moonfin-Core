import BackgroundTasks
import XCTest

@testable import Runner

private final class FakeScheduler: BackgroundTaskScheduling {
  var registeredIdentifier: String?
  var launchHandler: ((BGTask) -> Void)?
  var submitted: [BGTaskRequest] = []
  var cancelled: [String] = []
  var submitError: Error?
  var registerResult = true

  func register(
    forTaskWithIdentifier identifier: String,
    using queue: DispatchQueue?,
    launchHandler: @escaping (BGTask) -> Void
  ) -> Bool {
    registeredIdentifier = identifier
    self.launchHandler = launchHandler
    return registerResult
  }

  func submit(_ taskRequest: BGTaskRequest) throws {
    if let submitError { throw submitError }
    submitted.append(taskRequest)
  }

  func cancel(taskRequestWithIdentifier identifier: String) {
    cancelled.append(identifier)
  }
}

private final class FakeTask: RefreshTask {
  var expirationHandler: (() -> Void)?
  var completions: [Bool] = []

  func setTaskCompleted(success: Bool) {
    completions.append(success)
  }
}

private struct SubmitFailure: Error {}

final class BackgroundRefreshSchedulerTests: XCTestCase {
  private var scheduler: FakeScheduler!
  private var defaults: UserDefaults!
  private var runnerCompletion: ((Bool) -> Void)?
  private var runnerBudgets: [Int] = []
  private var logs: [String] = []

  override func setUp() {
    super.setUp()
    scheduler = FakeScheduler()
    let suite = "BackgroundRefreshSchedulerTests.\(UUID().uuidString)"
    defaults = UserDefaults(suiteName: suite)
    defaults.removePersistentDomain(forName: suite)
    runnerCompletion = nil
    runnerBudgets = []
    logs = []
  }

  private func makeScheduler(bundleId: String = "org.moonfin.app") -> BackgroundRefreshScheduler {
    BackgroundRefreshScheduler(
      bundleIdentifier: bundleId,
      scheduler: scheduler,
      defaults: defaults,
      runner: { [weak self] budget, completion in
        self?.runnerBudgets.append(budget)
        self?.runnerCompletion = completion
      },
      log: { [weak self] in self?.logs.append($0) }
    )
  }

  func testIdentifierDerivesFromBundleIdentifier() {
    let sut = makeScheduler(bundleId: "org.moonfin.app.kevindev")
    XCTAssertEqual(sut.taskIdentifier, "org.moonfin.app.kevindev.autodownload.refresh")
    sut.register()
    XCTAssertEqual(scheduler.registeredIdentifier, sut.taskIdentifier)
  }

  func testRegisterFailureIsLogged() {
    scheduler.registerResult = false
    let sut = makeScheduler()
    XCTAssertFalse(sut.register())
    XCTAssertEqual(logs.count, 1)
  }

  func testDisabledByDefaultSubmitsNothing() {
    let sut = makeScheduler()
    sut.scheduleNextIfEnabled()
    XCTAssertTrue(scheduler.submitted.isEmpty)
    XCTAssertFalse(sut.isEnabled)
  }

  func testConfigureEnabledSubmitsRequestWithInterval() {
    let sut = makeScheduler()
    sut.configure(enabled: true)

    XCTAssertTrue(sut.isEnabled)
    XCTAssertEqual(scheduler.submitted.count, 1)
    let request = try! XCTUnwrap(scheduler.submitted.first as? BGAppRefreshTaskRequest)
    XCTAssertEqual(request.identifier, sut.taskIdentifier)
    let begin = try! XCTUnwrap(request.earliestBeginDate)
    XCTAssertEqual(
      begin.timeIntervalSinceNow, BackgroundRefreshScheduler.earliestInterval, accuracy: 5)
  }

  func testConfigureDisabledCancelsPendingRequest() {
    let sut = makeScheduler()
    sut.configure(enabled: true)
    sut.configure(enabled: false)

    XCTAssertFalse(sut.isEnabled)
    XCTAssertEqual(scheduler.cancelled, [sut.taskIdentifier])
  }

  func testSubmitFailureIsSwallowedAndLogged() {
    scheduler.submitError = SubmitFailure()
    let sut = makeScheduler()
    sut.configure(enabled: true)
    XCTAssertTrue(scheduler.submitted.isEmpty)
    XCTAssertEqual(logs.count, 1)
  }

  func testLaunchSchedulesNextRunBeforeRunning() {
    let sut = makeScheduler()
    sut.configure(enabled: true)
    scheduler.submitted.removeAll()

    let task = FakeTask()
    sut.handleLaunch(task)

    XCTAssertEqual(scheduler.submitted.count, 1, "follow-up request submitted at launch")
    XCTAssertEqual(runnerBudgets, [BackgroundRefreshScheduler.runBudgetSeconds])
    XCTAssertTrue(task.completions.isEmpty, "not completed until the runner answers")
  }

  func testRunnerSuccessCompletesTaskExactlyOnce() {
    let sut = makeScheduler()
    let task = FakeTask()
    sut.handleLaunch(task)

    runnerCompletion?(true)
    runnerCompletion?(true)
    task.expirationHandler?()

    XCTAssertEqual(task.completions, [true])
  }

  func testExpirationCompletesWithFailureAndIgnoresLateRunner() {
    let sut = makeScheduler()
    let task = FakeTask()
    sut.handleLaunch(task)

    task.expirationHandler?()
    runnerCompletion?(true)

    XCTAssertEqual(task.completions, [false])
  }

  func testRunnerFailureCompletesWithFailure() {
    let sut = makeScheduler()
    let task = FakeTask()
    sut.handleLaunch(task)

    runnerCompletion?(false)

    XCTAssertEqual(task.completions, [false])
  }

  func testLaunchWhileDisabledStillRunsButSchedulesNothing() {
    let sut = makeScheduler()
    let task = FakeTask()
    sut.handleLaunch(task)

    XCTAssertTrue(scheduler.submitted.isEmpty)
    XCTAssertEqual(runnerBudgets.count, 1)
  }
}
