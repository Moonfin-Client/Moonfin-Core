import UIKit

final class SubtitleOverlay: UIView {

    private let textLabel = UILabel()
    private let bitmapView = UIImageView()
    private let assImageView = UIImageView()
    private var eventQueue: [SubtitleEvent] = []
    private var activeEvent: SubtitleEvent?
    var delaySeconds: TimeInterval = 0

    private var subtitleFontSize: CGFloat = 24
    private var subtitleTextColor: UIColor = .white
    private var subtitleBgColor: UIColor = .clear
    private var subtitleStrokeColor: UIColor = .black
    private var subtitleStrokeWidth: CGFloat = 2
    private var subtitleBottomOffset: CGFloat = 80

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        isUserInteractionEnabled = false
        backgroundColor = .clear

        textLabel.numberOfLines = 0
        textLabel.textAlignment = .center
        textLabel.isHidden = true
        addSubview(textLabel)

        bitmapView.contentMode = .scaleAspectFit
        bitmapView.isHidden = true
        addSubview(bitmapView)

        assImageView.contentMode = .scaleToFill
        assImageView.isHidden = true
        addSubview(assImageView)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layoutTextLabel()
        layoutBitmapView()
        assImageView.frame = bounds
    }

    func showAssImage(_ image: CGImage?) {
        if let image {
            assImageView.image = UIImage(cgImage: image)
            assImageView.isHidden = false
        } else {
            assImageView.image = nil
            assImageView.isHidden = true
        }
    }

    func enqueue(_ event: SubtitleEvent) {
        eventQueue.append(event)
        eventQueue.sort { $0.startTime < $1.startTime }
        if eventQueue.count > 50 {
            eventQueue.removeFirst(eventQueue.count - 50)
        }
    }

    func update(currentTime: TimeInterval) {
        let adjusted = currentTime - delaySeconds
        eventQueue.removeAll { $0.endTime < adjusted - 0.5 }
        let current = eventQueue.first { adjusted >= $0.startTime && adjusted < $0.endTime }

        if let current {
            if activeEvent == nil || activeEvent!.startTime != current.startTime {
                showEvent(current)
            }
        } else if activeEvent != nil {
            hideAll()
        }
    }

    func clear() {
        eventQueue.removeAll()
        hideAll()
        assImageView.image = nil
        assImageView.isHidden = true
    }

    func applyStyle(options: [String: Any]) {
        if let relSize = options["freetype-rel-fontsize"] as? Int, relSize > 0 {
            subtitleFontSize = CGFloat(1080 / relSize)
        }
        if let color = options["freetype-color"] as? Int {
            subtitleTextColor = Self.colorFromRGB(color, alpha: 255)
        }
        let bgOpacity = options["freetype-background-opacity"] as? Int ?? 0
        let bgColorValue = options["freetype-background-color"] as? Int ?? 0
        subtitleBgColor = Self.colorFromRGB(bgColorValue, alpha: bgOpacity)
        if let outlineColor = options["freetype-outline-color"] as? Int {
            subtitleStrokeColor = Self.colorFromRGB(outlineColor, alpha: 255)
        }
        if let thickness = options["freetype-outline-thickness"] as? Int {
            subtitleStrokeWidth = CGFloat(thickness)
        }
        if let offset = options["sub-margin"] as? Int {
            subtitleBottomOffset = CGFloat(offset)
        }
        if let event = activeEvent, event.text != nil {
            showEvent(event)
        }
    }

    // MARK: - Display

    private func showEvent(_ event: SubtitleEvent) {
        activeEvent = event
        if let text = event.text {
            bitmapView.isHidden = true
            bitmapView.image = nil
            textLabel.attributedText = styledText(text)
            textLabel.isHidden = false
            layoutTextLabel()
        } else if let bitmap = event.bitmap {
            textLabel.isHidden = true
            textLabel.attributedText = nil
            bitmapView.image = UIImage(cgImage: bitmap)
            bitmapView.isHidden = false
            layoutBitmapView()
        }
    }

    private func hideAll() {
        activeEvent = nil
        textLabel.isHidden = true
        textLabel.attributedText = nil
        bitmapView.isHidden = true
        bitmapView.image = nil
    }

    private func layoutTextLabel() {
        guard !textLabel.isHidden else { return }
        let maxWidth = bounds.width * 0.9
        let size = textLabel.sizeThatFits(CGSize(width: maxWidth, height: bounds.height * 0.4))
        textLabel.frame = CGRect(
            x: (bounds.width - size.width) / 2,
            y: bounds.height - size.height - subtitleBottomOffset,
            width: size.width,
            height: size.height
        )
    }

    private func layoutBitmapView() {
        guard !bitmapView.isHidden, let event = activeEvent, event.bitmapWidth > 0 else { return }
        let scale = min(bounds.width / CGFloat(event.bitmapWidth), 1.0)
        let w = CGFloat(event.bitmapWidth) * scale
        let h = CGFloat(event.bitmapHeight) * scale
        bitmapView.frame = CGRect(
            x: (bounds.width - w) / 2,
            y: bounds.height - h - subtitleBottomOffset,
            width: w,
            height: h
        )
    }

    private func styledText(_ text: String) -> NSAttributedString {
        let font = UIFont.systemFont(ofSize: subtitleFontSize, weight: .semibold)
        var attrs: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: subtitleTextColor,
        ]
        if subtitleStrokeWidth > 0 {
            attrs[.strokeColor] = subtitleStrokeColor
            attrs[.strokeWidth] = -subtitleStrokeWidth
        }
        if subtitleBgColor != .clear {
            attrs[.backgroundColor] = subtitleBgColor
        }
        return NSAttributedString(string: text, attributes: attrs)
    }

    private static func colorFromRGB(_ rgb: Int, alpha: Int) -> UIColor {
        UIColor(
            red: CGFloat((rgb >> 16) & 0xFF) / 255.0,
            green: CGFloat((rgb >> 8) & 0xFF) / 255.0,
            blue: CGFloat(rgb & 0xFF) / 255.0,
            alpha: CGFloat(alpha) / 255.0
        )
    }
}
