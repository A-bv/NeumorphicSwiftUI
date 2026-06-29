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

    func body(content: Content) -> some View {
        content
            .shadow(color: palette.lowerShadow, radius: 10, x: 10, y: 10)
            .shadow(color: palette.upperShadow, radius: 10, x: -5, y: -5)
    }
}
