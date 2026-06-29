import Testing
import SwiftUI
@testable import NeumorphicSwiftUI

@MainActor
struct NeumorphicSwiftUITests {
    @Test func paletteDefaultsAreSensible() {
        let palette = NeumorphicPalette()
        #expect(palette.gradientStart == .gray)
        #expect(palette.gradientEnd == .gray)
        #expect(palette.background == .clear)
        #expect(palette.highlightStroke == .accentColor)
    }

    @Test func environmentDefaultsToThePaletteDefaults() {
        let palette = EnvironmentValues().neumorphicPalette
        #expect(palette.gradientStart == .gray)
        #expect(palette.background == .clear)
    }

    @Test func neumorphicThemeInjectsTheGivenPalette() {
        var environment = EnvironmentValues()
        environment.neumorphicPalette = NeumorphicPalette(gradientStart: .red, background: .black)

        #expect(environment.neumorphicPalette.gradientStart == .red)
        #expect(environment.neumorphicPalette.background == .black)
    }
}
