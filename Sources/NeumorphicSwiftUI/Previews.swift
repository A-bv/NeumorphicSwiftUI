#if DEBUG
import SwiftUI

// Living preview for the neumorphic styles, fed a sample palette so they render
// standalone. The host app injects its own via `.neumorphicTheme(_:)` near the root.
// Uses `PreviewProvider` (not the `#Preview` macro) so the package stays iOS 15+.
struct NeumorphicStyles_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 48) {
            Button {} label: { Image(systemName: "paperplane.fill").font(.title2) }
                .buttonStyle(NeumorphicButtonStyle())

            Toggle(isOn: .constant(true)) { Image(systemName: "moon.fill").font(.title2) }
                .toggleStyle(NeumorphicToggleStyle())
                .labelsHidden()

            Circle()
                .fill(Color(white: 0.93))
                .neumorphicShadow()
                .frame(width: 90, height: 90)
        }
        .padding(64)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(white: 0.93))
        .neumorphicTheme(.preview)
    }
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
#endif
