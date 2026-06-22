import Testing
import SwiftUI
@testable import NeumorphicSwiftUI

@MainActor
struct NeumorphicSwiftUITests {
    @Test func configureStoresTheInjectedPalette() {
        NeumorphicTheme.configure(NeumorphicPalette(
            gradientStart: .red,
            gradientEnd: .blue,
            lowerShadow: .black,
            upperShadow: .white,
            highlightStroke: .green,
            baseStroke: .gray,
            background: .clear))

        #expect(NeumorphicTheme.palette.gradientStart == .red)
        #expect(NeumorphicTheme.palette.gradientEnd == .blue)
        #expect(NeumorphicTheme.palette.background == .clear)
    }
}
