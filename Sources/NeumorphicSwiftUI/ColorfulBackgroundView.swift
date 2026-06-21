import SwiftUI

/// The gradient + dual-shadow backing shared by the neumorphic button and toggle
/// styles. Package-internal — call sites use ``ColorfulButtonStyle`` / ``DarkToggleStyle``.
struct ColorfulBackgroundView<S: Shape>: View {
    var isHighlighted: Bool
    var shape: S

    var body: some View {
        let palette = NeumorphicTheme.palette
        ZStack {
            if isHighlighted {
                shape
                    .fill(gradient(palette.gradientEnd, palette.gradientStart))
                    .overlay(shape.stroke(gradient(palette.highlightStroke, palette.baseStroke), lineWidth: 4))
                    .shadow(color: palette.gradientStart, radius: 10, x: 5, y: 5)
                    .shadow(color: palette.gradientEnd, radius: 10, x: -5, y: -5)
            } else {
                shape
                    .fill(gradient(palette.gradientStart, palette.gradientEnd))
                    .overlay(shape.stroke(palette.background, lineWidth: 4))
                    .shadow(color: palette.gradientStart, radius: 10, x: -10, y: -10)
                    .shadow(color: palette.gradientEnd, radius: 10, x: 10, y: 10)
            }
        }
        .padding(5)
    }

    private func gradient(_ first: Color, _ second: Color) -> LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [first, second]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
    }
}
