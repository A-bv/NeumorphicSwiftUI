import SwiftUI

public extension View {
    /// Adds the soft outer neumorphic shadow pair on top of the view's own fill.
    /// Purely additive: apply it after a `.fill(...)`, and removing it leaves the
    /// view's standard appearance untouched.
    @MainActor
    func neumorphicShadow() -> some View {
        let palette = NeumorphicTheme.palette
        return shadow(color: palette.lowerShadow, radius: 10, x: 10, y: 10)
            .shadow(color: palette.upperShadow, radius: 10, x: -5, y: -5)
    }
}
