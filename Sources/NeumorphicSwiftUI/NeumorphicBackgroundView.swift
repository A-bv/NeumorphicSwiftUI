import SwiftUI

/// The gradient + dual-shadow backing shared by the neumorphic button and toggle
/// styles. Package-internal; call sites use ``NeumorphicButtonStyle`` / ``NeumorphicToggleStyle``.
struct NeumorphicBackgroundView<S: Shape>: View {
    @Environment(\.neumorphicPalette) private var palette
    @Environment(\.neumorphicMetrics) private var metrics
    var isHighlighted: Bool
    var shape: S

    var body: some View {
        let offsets = metrics.shadowOffsets(isHighlighted: isHighlighted)
        return shape
            .fill(isHighlighted
                ? gradient(palette.gradientEnd, palette.gradientStart)
                : gradient(palette.gradientStart, palette.gradientEnd))
            .overlay(shape.stroke(strokeStyle, lineWidth: metrics.strokeWidth))
            .shadow(color: palette.gradientStart, radius: metrics.shadowRadius,
                    x: offsets.near, y: offsets.near)
            .shadow(color: palette.gradientEnd, radius: metrics.shadowRadius,
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

/// Wraps a control's label in the neumorphic surface: the shared background plus a
/// hit-test shape whose corner radius comes from the environment metrics. The button and
/// toggle styles both build on this so they stay consistent and pick up custom metrics.
struct NeumorphicSurface<Label: View>: View {
    @Environment(\.neumorphicMetrics) private var metrics
    private let isHighlighted: Bool
    private let label: Label

    init(isHighlighted: Bool, @ViewBuilder label: () -> Label) {
        self.isHighlighted = isHighlighted
        self.label = label()
    }

    var body: some View {
        let shape = RoundedRectangle(cornerRadius: metrics.cornerRadius)
        return label
            .padding(10)
            .contentShape(shape)
            .background(NeumorphicBackgroundView(isHighlighted: isHighlighted, shape: shape))
    }
}
