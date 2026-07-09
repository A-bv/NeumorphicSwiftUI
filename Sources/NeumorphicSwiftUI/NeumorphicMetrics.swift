import SwiftUI

/// Tunes the shape and depth of the neumorphic look. Inject it alongside the palette, or
/// on its own, to make the controls rounder, softer, or more raised. Every value has a
/// default matching the built-in look, so you set only what you want to change.
public struct NeumorphicMetrics {
    /// The corner roundness of the button and toggle. Larger is rounder.
    public var cornerRadius: CGFloat
    /// The blur of every soft shadow. Larger is softer.
    public var shadowRadius: CGFloat
    /// The width of the outline around a control.
    public var strokeWidth: CGFloat
    /// How far the shadows are cast, which reads as how raised the control looks.
    public var depth: CGFloat

    public init(
        cornerRadius: CGFloat = 10,
        shadowRadius: CGFloat = 10,
        strokeWidth: CGFloat = 4,
        depth: CGFloat = 10
    ) {
        self.cornerRadius = cornerRadius
        self.shadowRadius = shadowRadius
        self.strokeWidth = strokeWidth
        self.depth = depth
    }

    /// Offsets for the two background shadows, defined once from `depth` so the raised and
    /// pressed looks stay in proportion. The raised state casts them `depth` points out;
    /// the pressed state pulls them halfway back and flips them.
    func shadowOffsets(isHighlighted: Bool) -> (near: CGFloat, far: CGFloat) {
        isHighlighted ? (near: depth / 2, far: -depth / 2) : (near: -depth, far: depth)
    }
}

private struct NeumorphicMetricsKey: EnvironmentKey {
    static let defaultValue = NeumorphicMetrics()
}

public extension EnvironmentValues {
    /// The metrics the neumorphic styles read. Defaults to ``NeumorphicMetrics``'s own
    /// defaults; override for a subtree with ``SwiftUICore/View/neumorphicMetrics(_:)``.
    var neumorphicMetrics: NeumorphicMetrics {
        get { self[NeumorphicMetricsKey.self] }
        set { self[NeumorphicMetricsKey.self] = newValue }
    }
}

public extension View {
    /// Sets the shape and depth of the neumorphic styles for this subtree.
    func neumorphicMetrics(_ metrics: NeumorphicMetrics) -> some View {
        environment(\.neumorphicMetrics, metrics)
    }

    /// Injects the palette and the metrics together, for a single call near the root.
    func neumorphicTheme(_ palette: NeumorphicPalette, metrics: NeumorphicMetrics) -> some View {
        environment(\.neumorphicPalette, palette)
            .environment(\.neumorphicMetrics, metrics)
    }
}
