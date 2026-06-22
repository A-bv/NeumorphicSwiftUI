import SwiftUI

// Living previews for the neumorphic styles, configured with a sample palette so they
// render standalone. The host app injects its own via `NeumorphicTheme.configure(_:)`.
#Preview("Styles") {
    NeumorphicTheme.configure(.preview)

    return VStack(spacing: 48) {
        Button {} label: { Image(systemName: "paperplane.fill").font(.title2) }
            .buttonStyle(ColorfulButtonStyle())

        Toggle(isOn: .constant(true)) { Image(systemName: "moon.fill").font(.title2) }
            .toggleStyle(DarkToggleStyle())
            .labelsHidden()

        Circle()
            .outerNeumorphism(Color(white: 0.93))
            .frame(width: 90, height: 90)
    }
    .padding(64)
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color(white: 0.93))
}

private extension NeumorphicPalette {
    /// Neutral sample palette for previews only.
    static let preview = NeumorphicPalette(
        gradientStart: Color(white: 0.97),
        gradientEnd: Color(white: 0.86),
        lowerShadow: .black.opacity(0.20),
        upperShadow: .white,
        highlightStroke: .blue,
        baseStroke: Color(white: 0.80),
        background: Color(white: 0.93))
}
