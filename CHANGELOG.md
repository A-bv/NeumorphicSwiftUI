# Changelog

All notable changes to this project are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Unreleased

## 3.5.0 - 2026-11-26

### Added
- `neumorphicInnerShadow(in:)` carves a view into a recessed well of any shape, the inset
  mirror of `neumorphicShadow()`. It reads the palette and metrics from the environment
  like the raised shadow. Requires iOS 16 / macOS 13, since it uses SwiftUI's inner
  `ShapeStyle` shadows.

## 3.4.1 - 2026-11-10

### Fixed
- The button and toggle shadows no longer stack: the dark shadow used to also shade the
  light one, which smudged the edges of small controls.

## 3.4.0 - 2026-11-10

### Changed
- The button and toggle now cast their shadows in the palette's `lowerShadow` and
  `upperShadow`, like `neumorphicShadow()`, instead of the gradient colors. They look
  more raised, and one pair of colors sets every shadow. If you pass your own gradient
  colors, set `lowerShadow` and `upperShadow` too, since their defaults suit a light surface.

## 3.3.0 - 2026-07-10

### Added
- `NeumorphicMetrics` tunes the corner radius, shadow softness, stroke width, and depth.
  Inject it with `.neumorphicMetrics(_:)`, or alongside the palette in `.neumorphicTheme`.

## 3.2.0 - 2026-07-04

### Added
- `NeumorphicPalette(surface:accent:)` derives the whole palette from one color, so
  the common case no longer needs all seven colors passed by hand.

### Changed
- The default palette now uses two distinct light shades, so the styles show the
  neumorphic effect even without an injected theme (they were a flat grey before).

### Fixed
- The toggle's on/off change is now instant, matching the button's crisp press.

## 3.1.1 - 2026-07-01

### Added
- MIT `LICENSE`, so the package can now be depended on and redistributed.

### Fixed
- The neumorphic toggle no longer inherits the system button tint and
  press dimming, so its label renders like `NeumorphicButtonStyle`'s.

## 3.1.0 - 2026-06-30

### Added
- `NeumorphicButtonStyle` and `NeumorphicToggleStyle`, aligning the public API on
  the `Neumorphic*` prefix used by `neumorphicShadow()` / `neumorphicTheme(_:)`.

### Deprecated
- `ColorfulButtonStyle` and `DarkToggleStyle` are now deprecated aliases of the
  renamed styles. They keep working and the compiler offers a fix-it; they will be
  removed in a future major release.

### Changed
- Grouped the shared corner radius, shadow blur, and stroke width into a single
  internal `NeumorphicMetrics` so the styles stay visually consistent.

### Fixed
- Installation snippet pointed at `from: "1.0.0"`, which never resolved to the
  current `neumorphicTheme` API; it now points at `3.0.0`.

## 3.0.0 - 2026-06-29

### Changed
- **Breaking:** the palette is now injected through the SwiftUI environment with
  `.neumorphicTheme(_:)` instead of the `NeumorphicTheme.configure(_:)` global.
  This removes the global mutable state, so the palette flows per subtree and the
  styles re-render reactively when it changes.

### Fixed
- Button/toggle hit-test now matches the visible rounded rectangle (was a circle).
- `DarkToggleStyle` reports proper switch accessibility (on/off value plus the
  `.isToggle` trait on iOS 17+).
- README states the real minimum (iOS 15) and drops the stale `#Preview` mentions.

### Added
- Declared the macOS platform so `swift build` / `swift test` work from the CLI.

### Migration
```swift
// Before (2.x)
NeumorphicTheme.configure(palette)

// After (3.0)
ContentView().neumorphicTheme(palette)
```

## 2.1.0 - 2026-06-22

### Changed
- Support iOS 15 by using `PreviewProvider` instead of the `#Preview` macro.

## 2.0.0 - 2026-06-22

### Changed
- **Breaking:** `neumorphicShadow()` is now additive and replaces `outerNeumorphism`;
  the palette gained sensible defaults.

## 1.0.1 - 2026-06-22

### Added
- README and a standalone preview.
- Unit tests covering palette configuration.

## 1.0.0 - 2026-06-22

### Added
- Initial release: palette-agnostic neumorphic theme with a configure entry point.

