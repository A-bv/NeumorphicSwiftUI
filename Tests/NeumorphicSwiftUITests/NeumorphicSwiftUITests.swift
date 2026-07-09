import Testing
import SwiftUI
@testable import NeumorphicSwiftUI

@MainActor
struct NeumorphicSwiftUITests {
    @Test func paletteDefaultsAreSensible() {
        let palette = NeumorphicPalette()
        // The two gradient shades differ so the neumorphic depth shows without a theme.
        #expect(palette.gradientStart == Color(white: 0.97))
        #expect(palette.gradientEnd == Color(white: 0.86))
        #expect(palette.gradientStart != palette.gradientEnd)
        #expect(palette.background == .clear)
        #expect(palette.highlightStroke == .accentColor)
    }

    @Test func environmentDefaultsToThePaletteDefaults() {
        let palette = EnvironmentValues().neumorphicPalette
        #expect(palette.gradientStart == Color(white: 0.97))
        #expect(palette.background == .clear)
    }

    @Test func neumorphicThemeInjectsTheGivenPalette() {
        var environment = EnvironmentValues()
        environment.neumorphicPalette = NeumorphicPalette(gradientStart: .red, background: .black)

        #expect(environment.neumorphicPalette.gradientStart == .red)
        #expect(environment.neumorphicPalette.background == .black)
    }

    @Test func surfaceInitDerivesDistinctShadesFromOneColor() {
        let surface = Color(white: 0.9)
        let palette = NeumorphicPalette(surface: surface)
        #expect(palette.background == surface)
        #expect(palette.gradientStart != palette.gradientEnd)
        #expect(palette.highlightStroke == .accentColor)
    }

    @Test func surfaceInitUsesTheGivenAccent() {
        let palette = NeumorphicPalette(surface: Color(white: 0.9), accent: .red)
        #expect(palette.highlightStroke == .red)
    }

    @Test func raisedShadowOffsetsCastOutward() {
        let offsets = NeumorphicMetrics.shadowOffsets(isHighlighted: false)
        #expect(offsets.near == -10)
        #expect(offsets.far == 10)
    }

    @Test func pressedShadowOffsetsPullInward() {
        let offsets = NeumorphicMetrics.shadowOffsets(isHighlighted: true)
        #expect(offsets.near == 5)
        #expect(offsets.far == -5)
    }
}
