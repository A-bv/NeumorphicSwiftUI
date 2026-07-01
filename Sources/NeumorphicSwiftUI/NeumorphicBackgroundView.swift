import SwiftUI

/// Layout/styling values shared across the neumorphic styles, defined once so the
/// hit-test region, fill, stroke, and shadows stay consistent and can't drift apart.
enum NeumorphicMetrics {
    static let cornerRadius: CGFloat = 10
    static let shadowRadius: CGFloat = 10
    static let strokeWidth: CGFloat = 4
}

/// The gradient + dual-shadow backing shared by the neumorphic button and toggle
/// styles. Package-internal — call sites use ``NeumorphicButtonStyle`` / ``NeumorphicToggleStyle``.
struct NeumorphicBackgroundView<S: Shape>: View {
    @Environment(\.neumorphicPalette) private var palette
    var isHighlighted: Bool
    var shape: S

    var body: some View {
        shape
            .fill(isHighlighted
                ? gradient(palette.gradientEnd, palette.gradientStart)
                : gradient(palette.gradientStart, palette.gradientEnd))
            .overlay(shape.stroke(strokeStyle, lineWidth: NeumorphicMetrics.strokeWidth))
            .shadow(color: palette.gradientStart, radius: NeumorphicMetrics.shadowRadius,
                    x: nearShadowOffset, y: nearShadowOffset)
            .shadow(color: palette.gradientEnd, radius: NeumorphicMetrics.shadowRadius,
                    x: farShadowOffset, y: farShadowOffset)
            .padding(5)
    }

    /// The stroke is a gradient when pressed and a solid `background` otherwise, so
    /// the two static styles are erased to a single type.
    private var strokeStyle: AnyShapeStyle {
        isHighlighted
            ? AnyShapeStyle(gradient(palette.highlightStroke, palette.baseStroke))
            : AnyShapeStyle(palette.background)
    }

    private var nearShadowOffset: CGFloat { isHighlighted ? 5 : -10 }
    private var farShadowOffset: CGFloat { isHighlighted ? -5 : 10 }

    private func gradient(_ first: Color, _ second: Color) -> LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [first, second]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
    }
}
