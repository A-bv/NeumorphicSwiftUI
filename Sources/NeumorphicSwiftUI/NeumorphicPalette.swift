import SwiftUI
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

/// The colors the SwiftUI neumorphic styles need. Every value has a sensible default,
/// so a host app overrides only the values it cares about, then injects the palette
/// with ``SwiftUICore/View/neumorphicTheme(_:)``.
public struct NeumorphicPalette {
    /// The lighter surface shade. Fills the top-left of the button and toggle
    /// gradient and tints their light shadow.
    public let gradientStart: Color
    /// The darker surface shade. Fills the bottom-right of that gradient and
    /// tints their dark shadow.
    public let gradientEnd: Color
    /// The dark shadow cast to the bottom-right by ``SwiftUICore/View/neumorphicShadow()``.
    /// Only that modifier uses it; the button and toggle shade their own shadows
    /// from the gradient colors above.
    public let lowerShadow: Color
    /// The light shadow cast to the top-left by ``SwiftUICore/View/neumorphicShadow()``,
    /// with the same scope as `lowerShadow`.
    public let upperShadow: Color
    /// One end of the stroke drawn around a pressed button or toggle.
    public let highlightStroke: Color
    /// The other end of that pressed stroke.
    public let baseStroke: Color
    /// The stroke drawn around a button or toggle at rest, usually your surface
    /// color, so the edge blends in.
    public let background: Color

    public init(
        gradientStart: Color = Color(white: 0.97),
        gradientEnd: Color = Color(white: 0.86),
        lowerShadow: Color = .black.opacity(0.2),
        upperShadow: Color = .white,
        highlightStroke: Color = .accentColor,
        baseStroke: Color = .gray,
        background: Color = .clear
    ) {
        self.gradientStart = gradientStart
        self.gradientEnd = gradientEnd
        self.lowerShadow = lowerShadow
        self.upperShadow = upperShadow
        self.highlightStroke = highlightStroke
        self.baseStroke = baseStroke
        self.background = background
    }

    /// Builds a full palette from one surface color, deriving the light and dark shades,
    /// the shadows, and the strokes by brightening and darkening it. Use this for the
    /// common case; reach for the memberwise initializer to set every color yourself.
    /// - Parameters:
    ///   - surface: The control's base color, ideally matching the background it sits on.
    ///   - accent: The color outlining a pressed control. Defaults to the app accent.
    public init(surface: Color, accent: Color = .accentColor) {
        self.init(
            gradientStart: surface.brightened(by: 0.07),
            gradientEnd: surface.brightened(by: -0.07),
            lowerShadow: surface.brightened(by: -0.12),
            upperShadow: surface.brightened(by: 0.12),
            highlightStroke: accent,
            baseStroke: surface.brightened(by: -0.07),
            background: surface)
    }
}

private extension Color {
    /// Returns this color with its brightness moved by `delta` (clamped to `0...1`),
    /// keeping hue, saturation, and opacity. Used to derive the neumorphic shades from
    /// one surface color. Returns the color unchanged if it can't be read as HSB.
    func brightened(by delta: Double) -> Color {
        var hue: CGFloat = 0, saturation: CGFloat = 0, brightness: CGFloat = 0, alpha: CGFloat = 0
        #if canImport(UIKit)
        guard UIColor(self).getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        else { return self }
        #elseif canImport(AppKit)
        guard let native = NSColor(self).usingColorSpace(.deviceRGB) else { return self }
        native.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        #endif
        return Color(hue: Double(hue), saturation: Double(saturation),
                     brightness: min(max(Double(brightness) + delta, 0), 1), opacity: Double(alpha))
    }
}
