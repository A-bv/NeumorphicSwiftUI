import SwiftUI

@available(iOS 16, macOS 13, *)
public extension View {
    /// Carves the view into a soft neumorphic well of the given shape, the inset mirror of
    /// ``SwiftUICore/View/neumorphicShadow()``. The shape is filled with the palette's
    /// `background` and given two inner shadows read from the palette and metrics in the
    /// environment: a dark one from the lower-right and a light one from the upper-left,
    /// the same directions as the raised shadow so a recess sits naturally beside it.
    ///
    /// Apply it to size the well, then place content inside to sit it in the recess:
    /// ```swift
    /// GaugeArc().neumorphicInnerShadow(in: Circle())
    /// ```
    ///
    /// - Parameters:
    ///   - shape: The shape of the well, for example `Circle()` or
    ///     `RoundedRectangle(cornerRadius: 16)`.
    ///   - depth: How deep the recess reads. Defaults to the environment metric.
    ///   - radius: The blur of the inner shadows. Defaults to the environment metric.
    func neumorphicInnerShadow<S: Shape>(in shape: S, depth: CGFloat? = nil, radius: CGFloat? = nil) -> some View {
        modifier(NeumorphicInnerShadow(shape: shape, depth: depth, radius: radius))
    }
}

@available(iOS 16, macOS 13, *)
private struct NeumorphicInnerShadow<S: Shape>: ViewModifier {
    @Environment(\.neumorphicPalette) private var palette
    @Environment(\.neumorphicMetrics) private var metrics
    let shape: S
    let depth: CGFloat?
    let radius: CGFloat?

    func body(content: Content) -> some View {
        let depth = depth ?? metrics.depth
        let radius = radius ?? metrics.shadowRadius
        return content.background(
            shape.fill(
                palette.background
                    .shadow(.inner(color: palette.lowerShadow, radius: radius, x: depth, y: depth))
                    .shadow(.inner(color: palette.upperShadow, radius: radius, x: -depth / 2, y: -depth / 2))
            )
        )
    }
}

#if DEBUG
@available(iOS 16, macOS 13, *)
struct NeumorphicInnerShadow_Previews: PreviewProvider {
    static var previews: some View {
        HStack(spacing: 44) {
            Color.clear.frame(width: 120, height: 120)
                .neumorphicInnerShadow(in: Circle())
            Color.clear.frame(width: 150, height: 82)
                .neumorphicInnerShadow(in: RoundedRectangle(cornerRadius: 18))
        }
        .padding(64)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(white: 0.90))
        .neumorphicTheme(NeumorphicPalette(surface: Color(white: 0.90)))
    }
}
#endif
