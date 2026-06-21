import SwiftUI

/// The colors the SwiftUI neumorphic styles need. The host app injects its own
/// palette through ``NeumorphicTheme/configure(_:)`` so this package ships none.
public struct NeumorphicPalette {
    public let gradientStart: Color
    public let gradientEnd: Color
    public let lowerShadow: Color
    public let upperShadow: Color
    public let highlightStroke: Color
    public let baseStroke: Color
    public let background: Color

    public init(
        gradientStart: Color,
        gradientEnd: Color,
        lowerShadow: Color,
        upperShadow: Color,
        highlightStroke: Color,
        baseStroke: Color,
        background: Color
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
