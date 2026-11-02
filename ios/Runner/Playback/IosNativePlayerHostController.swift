import UIKit

/// Presents the Apple TV player and its panels on iPhone and iPad.
///
/// They lay themselves out on a canvas as wide as a television gives them, so
/// this host keeps them at that width and scales the whole thing down to fit
/// the screen. Touches go through the same transform, so every control answers
/// where it's drawn.
final class IosNativePlayerHostController: UIViewController {
    private static let canvasWidth: CGFloat = 1920

    /// The rotation lock a live player carries, true while it holds landscape.
    /// Nil keeps the default: landscape on a phone, any way round on a tablet.
    /// Panels follow it too, so one opening doesn't turn the screen.
    static var orientationLock: Bool?

    private static var allowedOrientations: UIInterfaceOrientationMask {
        if let locked = orientationLock { return locked ? .landscape : .all }
        return UIDevice.current.userInterfaceIdiom == .phone ? .landscape : .all
    }

    private let content: UIViewController
    private let opaque: Bool
    private let closesOnOutsideTap: Bool

    /// A panel shows the player through it, so it isn't opaque, and it closes
    /// with a tap outside it because a touch screen has no Menu button. A panel
    /// that handles that tap itself, to run its own way out, turns it off.
    init(content: UIViewController, opaque: Bool = true, closesOnOutsideTap: Bool = true) {
        self.content = content
        self.opaque = opaque
        self.closesOnOutsideTap = closesOnOutsideTap
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .overFullScreen
        modalPresentationCapturesStatusBarAppearance = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = opaque ? .black : .clear
        addChild(content)
        view.addSubview(content.view)
        content.didMove(toParent: self)
        if !opaque && closesOnOutsideTap {
            let outside = UITapGestureRecognizer(
                target: self, action: #selector(handleOutsideTap(_:)))
            outside.cancelsTouchesInView = false
            content.view.addGestureRecognizer(outside)
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let bounds = view.bounds
        guard bounds.width > 0, bounds.height > 0 else { return }
        let scale = bounds.width / Self.canvasWidth
        // Bounds and center stay valid under a transform, where frame doesn't.
        content.view.transform = .identity
        content.view.bounds = CGRect(
            x: 0, y: 0, width: Self.canvasWidth, height: bounds.height / scale)
        content.view.center = CGPoint(x: bounds.midX, y: bounds.midY)
        content.view.transform = CGAffineTransform(scaleX: scale, y: scale)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshOrientation()
    }

    func refreshOrientation() {
        setNeedsUpdateOfSupportedInterfaceOrientations()
        // Asking again while already in landscape can flip it to the other side.
        guard Self.allowedOrientations == .landscape,
            let scene = view.window?.windowScene ?? presentingViewController?.view.window?.windowScene,
            !scene.interfaceOrientation.isLandscape
        else { return }
        scene.requestGeometryUpdate(.iOS(interfaceOrientations: .landscape)) { _ in }
    }

    @objc private func handleOutsideTap(_ recognizer: UITapGestureRecognizer) {
        let point = recognizer.location(in: content.view)
        guard content.view.hitTest(point, with: nil) === content.view else { return }
        dismiss(animated: true)
    }

    override var prefersStatusBarHidden: Bool { true }

    override var prefersHomeIndicatorAutoHidden: Bool { true }

    override var preferredScreenEdgesDeferringSystemGestures: UIRectEdge { .all }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        Self.allowedOrientations
    }
}
