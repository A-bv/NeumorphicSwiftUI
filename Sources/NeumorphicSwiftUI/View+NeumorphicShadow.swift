import SwiftUI

public extension View {
    /// Adds the soft outer neumorphic shadow pair on top of the view's own fill.
    /// Purely additive: apply it after a `.fill(...)`, and removing it leaves the
    /// view's standard appearance untouched. Reads the palette from the environment.
    func neumorphicShadow() -> some View {
        modifier(NeumorphicShadow())
    }
}

private struct NeumorphicShadow: ViewModifier {
    @Environment(\.neumorphicPalette) private var palette
    @Environment(\.neumorphicMetrics) private var metrics

    func body(content: Content) -> some View {
        content
            .shadow(color: palette.lowerShadow, radius: metrics.shadowRadius, x: metrics.depth, y: metrics.depth)
            .shadow(color: palette.upperShadow, radius: metrics.shadowRadius, x: -metrics.depth / 2, y: -metrics.depth / 2)
    }
}
