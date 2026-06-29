import Testing
import SwiftUI
@testable import NeumorphicSwiftUI

// `configure` mutates a single global palette, so these cases must not run in parallel.
@MainActor
@Suite(.serialized)
struct NeumorphicSwiftUITests {
    @Test func paletteDefaultsAreSensible() {
        let palette = NeumorphicPalette()
        #expect(palette.gradientStart == .gray)
        #expect(palette.gradientEnd == .gray)
        #expect(palette.background == .clear)
        #expect(palette.highlightStroke == .accentColor)
    }

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

    @Test func configureReplacesAPreviouslyInjectedPalette() {
        NeumorphicTheme.configure(NeumorphicPalette(gradientStart: .red))
        NeumorphicTheme.configure(NeumorphicPalette(gradientStart: .green))

        #expect(NeumorphicTheme.palette.gradientStart == .green)
    }
}
