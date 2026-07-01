# Changelog

All notable changes to this project are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [3.1.1] - 2026-07-01

### Added
- MIT `LICENSE`, so the package can now be depended on and redistributed.

### Fixed
- The neumorphic toggle no longer inherits the system button tint and
  press dimming, so its label renders like `NeumorphicButtonStyle`'s.

## [3.1.0] - 2026-06-30

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

## [3.0.0] - 2026-06-29

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

## [2.1.0] - 2026-06-22

### Changed
- Support iOS 15 by using `PreviewProvider` instead of the `#Preview` macro.

## [2.0.0] - 2026-06-22

### Changed
- **Breaking:** `neumorphicShadow()` is now additive and replaces `outerNeumorphism`;
  the palette gained sensible defaults.

## [1.0.1] - 2026-06-22

### Added
- README and a standalone preview.
- Unit tests covering palette configuration.

## [1.0.0] - 2026-06-22

### Added
- Initial release: palette-agnostic neumorphic theme with a configure entry point.

[Unreleased]: https://github.com/A-bv/NeumorphicSwiftUI/compare/3.1.1...HEAD
[3.1.1]: https://github.com/A-bv/NeumorphicSwiftUI/compare/3.1.0...3.1.1
[3.1.0]: https://github.com/A-bv/NeumorphicSwiftUI/compare/3.0.0...3.1.0
[3.0.0]: https://github.com/A-bv/NeumorphicSwiftUI/compare/2.1.0...3.0.0
[2.1.0]: https://github.com/A-bv/NeumorphicSwiftUI/compare/2.0.0...2.1.0
[2.0.0]: https://github.com/A-bv/NeumorphicSwiftUI/compare/1.0.1...2.0.0
[1.0.1]: https://github.com/A-bv/NeumorphicSwiftUI/compare/1.0.0...1.0.1
[1.0.0]: https://github.com/A-bv/NeumorphicSwiftUI/releases/tag/1.0.0
