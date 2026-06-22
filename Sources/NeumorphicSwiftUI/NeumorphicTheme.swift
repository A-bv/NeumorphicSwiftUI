import SwiftUI

/// Entry point for the SwiftUI neumorphic theme. Call ``configure(_:)`` once at
/// launch with the app's palette, then use the styles and `neumorphicShadow()`.
@MainActor
public enum NeumorphicTheme {
    static var palette = NeumorphicPalette()

    /// Injects the app's palette. Call once, before any styled view is shown.
    public static func configure(_ palette: NeumorphicPalette) {
        self.palette = palette
    }
}
