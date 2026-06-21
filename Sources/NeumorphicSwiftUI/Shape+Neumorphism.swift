import SwiftUI

public extension Shape {
    /// Fills the shape and lays the soft outer neumorphic shadow pair.
    @MainActor
    func outerNeumorphism<S: ShapeStyle>(_ fillContent: S) -> some View {
        let palette = NeumorphicTheme.palette
        return self.fill(fillContent)
            .shadow(color: palette.lowerShadow, radius: 10, x: 10, y: 10)
            .shadow(color: palette.upperShadow, radius: 10, x: -5, y: -5)
    }
}
