import SwiftUI

/// The colors the SwiftUI neumorphic styles need. Every value has a sensible default,
/// so a host app injects only what it wants to override via ``NeumorphicTheme/configure(_:)``.
public struct NeumorphicPalette {
    public let gradientStart: Color
    public let gradientEnd: Color
    public let lowerShadow: Color
    public let upperShadow: Color
    public let highlightStroke: Color
    public let baseStroke: Color
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
