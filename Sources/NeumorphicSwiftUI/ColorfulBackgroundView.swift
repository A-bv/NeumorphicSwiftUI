import SwiftUI

/// Layout/styling values shared across the neumorphic styles, defined once so the
/// hit-test region, fill, stroke, and shadows stay consistent and can't drift apart.
enum NeumorphicMetrics {
    static let cornerRadius: CGFloat = 10
    static let shadowRadius: CGFloat = 10
    static let strokeWidth: CGFloat = 4
}

/// The gradient + dual-shadow backing shared by the neumorphic button and toggle
/// styles. Package-internal — call sites use ``ColorfulButtonStyle`` / ``DarkToggleStyle``.
struct ColorfulBackgroundView<S: Shape>: View {
    @Environment(\.neumorphicPalette) private var palette
    var isHighlighted: Bool
    var shape: S

    var body: some View {
        ZStack {
            if isHighlighted {
                shape
                    .fill(gradient(palette.gradientEnd, palette.gradientStart))
                    .overlay(shape.stroke(gradient(palette.highlightStroke, palette.baseStroke), lineWidth: NeumorphicMetrics.strokeWidth))
                    .shadow(color: palette.gradientStart, radius: NeumorphicMetrics.shadowRadius, x: 5, y: 5)
                    .shadow(color: palette.gradientEnd, radius: NeumorphicMetrics.shadowRadius, x: -5, y: -5)
            } else {
                shape
                    .fill(gradient(palette.gradientStart, palette.gradientEnd))
                    .overlay(shape.stroke(palette.background, lineWidth: NeumorphicMetrics.strokeWidth))
                    .shadow(color: palette.gradientStart, radius: NeumorphicMetrics.shadowRadius, x: -10, y: -10)
                    .shadow(color: palette.gradientEnd, radius: NeumorphicMetrics.shadowRadius, x: 10, y: 10)
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
