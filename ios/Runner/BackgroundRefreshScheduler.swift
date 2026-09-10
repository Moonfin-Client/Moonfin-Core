import BackgroundTasks
import Foundation

/// The parts of `BGTaskScheduler` the app uses, so tests can stand in a fake.
protocol BackgroundTaskScheduling {
  func register(
    forTaskWithIdentifier identifier: String,
    using queue: DispatchQueue?,
    launchHandler: @escaping (BGTask) -> Void
  ) -> Bool
  func submit(_ taskRequest: BGTaskRequest) throws
  func cancel(taskRequestWithIdentifier identifier: String)
}

extension BGTaskScheduler: BackgroundTaskScheduling {}

/// The parts of a launched `BGTask` the scheduler touches. `BGTask` cannot be
/// constructed outside the system, so tests hand in their own conformer.
protocol RefreshTask: AnyObject {
  var expirationHandler: (() -> Void)? { get set }
  func setTaskCompleted(success: Bool)
}

extension BGTask: RefreshTask {}

/// Owns the auto-download app-refresh task: registration at launch, the
/// on/off switch and interval Dart configures, resubmission every time the
/// app backgrounds or a run ends, and exactly-once completion of a launched
/// task whether the runner answers or iOS expires it first.
final class BackgroundRefreshScheduler {
  /// Runs the refresh work and reports success. Must call the completion
  /// exactly once; calling it after expiration is harmless.
  typealias Runner = (_ budgetSeconds: Int, _ completion: @escaping (Bool) -> Void) -> Void

  static let taskSuffix = ".autodownload.refresh"
  static let enabledKey = "moonfin.autoDownload.backgroundRefresh.enabled"

  /// Soonest iOS may run the task after the app backgrounds; the system
  /// usually waits longer.
  static let earliestInterval: TimeInterval = 4 * 60 * 60

  /// iOS grants an app-refresh task about 30 seconds; leave a margin for
  /// the Dart side to answer and for `setTaskCompleted`.
  static let runBudgetSeconds = 22

  let taskIdentifier: String
  private let scheduler: BackgroundTaskScheduling
  private let defaults: UserDefaults
  private let runner: Runner
  private let log: (String) -> Void
  private let lock = NSLock()

  init(
    bundleIdentifier: String,
    scheduler: BackgroundTaskScheduling,
    defaults: UserDefaults,
    runner: @escaping Runner,
    log: @escaping (String) -> Void = { NSLog("[BackgroundRefresh] %@", $0) }
  ) {
    self.taskIdentifier = bundleIdentifier + Self.taskSuffix
    self.scheduler = scheduler
    self.defaults = defaults
    self.runner = runner
    self.log = log
  }

  var isEnabled: Bool {
    defaults.object(forKey: Self.enabledKey) as? Bool ?? false
  }

  /// Must run before the app finishes launching, or iOS refuses the task.
  @discardableResult
  func register() -> Bool {
    let registered = scheduler.register(
      forTaskWithIdentifier: taskIdentifier, using: nil
    ) { [weak self] task in
      self?.handleLaunch(task)
    }
    if !registered {
      log("register failed for \(taskIdentifier); is it in BGTaskSchedulerPermittedIdentifiers?")
    }
    return registered
  }

  /// Called from Dart whenever the user changes the setting.
  func configure(enabled: Bool) {
    defaults.set(enabled, forKey: Self.enabledKey)
    if enabled {
      scheduleNextIfEnabled()
    } else {
      scheduler.cancel(taskRequestWithIdentifier: taskIdentifier)
    }
  }

  /// Submits the next request. A pending request with the same identifier
  /// is replaced, so calling this often is fine.
  func scheduleNextIfEnabled() {
    guard isEnabled else { return }
    let request = BGAppRefreshTaskRequest(identifier: taskIdentifier)
    request.earliestBeginDate = Date(timeIntervalSinceNow: Self.earliestInterval)
    do {
      try scheduler.submit(request)
    } catch {
      // Expected in the simulator and when refresh is off in Settings.
      log("submit failed: \(error)")
    }
  }

  /// Handles a launched task. Exposed so tests can drive it with a fake task.
  func handleLaunch(_ task: RefreshTask) {
    var finished = false
    let complete: (Bool) -> Void = { [weak self] success in
      guard let self else { return }
      self.lock.lock()
      let first = !finished
      finished = true
      self.lock.unlock()
      guard first else { return }
      task.setTaskCompleted(success: success)
      self.log("task completed success=\(success)")
    }
    task.expirationHandler = {
      complete(false)
    }
    // Apple's guidance: schedule the follow-up first, so a crash or an
    // expiration mid-run cannot break the chain.
    scheduleNextIfEnabled()
    runner(Self.runBudgetSeconds) { success in
      complete(success)
    }
  }
}
