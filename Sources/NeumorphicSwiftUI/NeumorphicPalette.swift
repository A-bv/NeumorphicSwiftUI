import SwiftUI

/// The colors the SwiftUI neumorphic styles need. Every value has a sensible default,
/// so a host app overrides only the values it cares about, then injects the palette
/// with ``SwiftUI/View/neumorphicTheme(_:)``.
public struct NeumorphicPalette {
    /// The lighter surface shade. Fills the top-left of the button and toggle
    /// gradient and tints their light shadow.
    public let gradientStart: Color
    /// The darker surface shade. Fills the bottom-right of that gradient and
    /// tints their dark shadow.
    public let gradientEnd: Color
    /// The dark shadow cast to the bottom-right by ``SwiftUI/View/neumorphicShadow()``.
    /// Only that modifier uses it; the button and toggle shade their own shadows
    /// from the gradient colors above.
    public let lowerShadow: Color
    /// The light shadow cast to the top-left by ``SwiftUI/View/neumorphicShadow()``,
    /// with the same scope as `lowerShadow`.
    public let upperShadow: Color
    /// One end of the stroke drawn around a pressed button or toggle.
    public let highlightStroke: Color
    /// The other end of that pressed stroke.
    public let baseStroke: Color
    /// The stroke drawn around a button or toggle at rest — usually your surface
    /// color, so the edge blends in.
    public let background: Color

    public init(
        gradientStart: Color = .gray,
        gradientEnd: Color = .gray,
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
}
