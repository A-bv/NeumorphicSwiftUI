import SwiftUI

/// Layout/styling values shared across the neumorphic styles, defined once so the
/// hit-test region, fill, stroke, and shadows stay consistent and can't drift apart.
enum NeumorphicMetrics {
    static let cornerRadius: CGFloat = 10
    static let shadowRadius: CGFloat = 10
    static let strokeWidth: CGFloat = 4

    /// Offsets for the background's two shadows, defined once here so the pressed and
    /// raised mapping can't drift and is pinned by tests. `near` is the shadow tinted
    /// with `gradientStart`, `far` the one tinted with `gradientEnd`.
    static func shadowOffsets(isHighlighted: Bool) -> (near: CGFloat, far: CGFloat) {
        isHighlighted ? (near: 5, far: -5) : (near: -10, far: 10)
    }
}

/// The gradient + dual-shadow backing shared by the neumorphic button and toggle
/// styles. Package-internal; call sites use ``NeumorphicButtonStyle`` / ``NeumorphicToggleStyle``.
struct NeumorphicBackgroundView<S: Shape>: View {
    @Environment(\.neumorphicPalette) private var palette
    var isHighlighted: Bool
    var shape: S

    var body: some View {
        let offsets = NeumorphicMetrics.shadowOffsets(isHighlighted: isHighlighted)
        return shape
            .fill(isHighlighted
                ? gradient(palette.gradientEnd, palette.gradientStart)
                : gradient(palette.gradientStart, palette.gradientEnd))
            .overlay(shape.stroke(strokeStyle, lineWidth: NeumorphicMetrics.strokeWidth))
            .shadow(color: palette.gradientStart, radius: NeumorphicMetrics.shadowRadius,
                    x: offsets.near, y: offsets.near)
            .shadow(color: palette.gradientEnd, radius: NeumorphicMetrics.shadowRadius,
                    x: offsets.far, y: offsets.far)
            .padding(5)
    }

    /// The stroke is a gradient when pressed and a solid `background` otherwise, so
    /// the two static styles are erased to a single type.
    private var strokeStyle: AnyShapeStyle {
        isHighlighted
            ? AnyShapeStyle(gradient(palette.highlightStroke, palette.baseStroke))
            : AnyShapeStyle(palette.background)
    }

    private func gradient(_ first: Color, _ second: Color) -> LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [first, second]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
    }
}
