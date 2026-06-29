import SwiftUI

private struct NeumorphicPaletteKey: EnvironmentKey {
    static let defaultValue = NeumorphicPalette()
}

public extension EnvironmentValues {
    /// The palette the neumorphic styles read. Defaults to ``NeumorphicPalette``'s
    /// own defaults; override it for a subtree with ``SwiftUI/View/neumorphicTheme(_:)``.
    var neumorphicPalette: NeumorphicPalette {
        get { self[NeumorphicPaletteKey.self] }
        set { self[NeumorphicPaletteKey.self] = newValue }
    }
}

public extension View {
    /// Injects the app's palette into the environment. Apply once near the root;
    /// every neumorphic style and `neumorphicShadow()` in the subtree reads from it,
    /// so changing the palette re-renders the affected views.
    func neumorphicTheme(_ palette: NeumorphicPalette) -> some View {
        environment(\.neumorphicPalette, palette)
    }
}
