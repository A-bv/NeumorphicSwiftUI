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

    @Test func metricsDefaultsMatchTheBuiltInLook() {
        let metrics = NeumorphicMetrics()
        #expect(metrics.cornerRadius == 10)
        #expect(metrics.shadowRadius == 10)
        #expect(metrics.strokeWidth == 4)
        #expect(metrics.depth == 10)
    }

    @Test func raisedShadowOffsetsCastOutward() {
        let offsets = NeumorphicMetrics().shadowOffsets(isHighlighted: false)
        #expect(offsets.near == -10)
        #expect(offsets.far == 10)
    }

    @Test func pressedShadowOffsetsPullInward() {
        let offsets = NeumorphicMetrics().shadowOffsets(isHighlighted: true)
        #expect(offsets.near == 5)
        #expect(offsets.far == -5)
    }

    @Test func depthScalesTheShadowOffsets() {
        let deep = NeumorphicMetrics(depth: 24)
        #expect(deep.shadowOffsets(isHighlighted: false) == (near: -24, far: 24))
        #expect(deep.shadowOffsets(isHighlighted: true) == (near: 12, far: -12))
    }

    @Test func neumorphicMetricsInjectsIntoTheEnvironment() {
        var environment = EnvironmentValues()
        environment.neumorphicMetrics = NeumorphicMetrics(cornerRadius: 20, depth: 6)
        #expect(environment.neumorphicMetrics.cornerRadius == 20)
        #expect(environment.neumorphicMetrics.depth == 6)
    }

    @Test func environmentDefaultsToTheMetricsDefaults() {
        #expect(EnvironmentValues().neumorphicMetrics.cornerRadius == 10)
    }
}
