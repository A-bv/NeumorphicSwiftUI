# NeumorphicSwiftUI

Neumorphic button, toggle, and surface styles for SwiftUI — themed by your palette.

NeumorphicSwiftUI gives you the soft, pressed-and-raised neumorphic look as plain SwiftUI styles you apply with a single modifier. It ships no colors: you inject your palette once, so it slots into any app's design system without forking.

## Features
- `ColorfulButtonStyle` and `DarkToggleStyle` — apply with `.buttonStyle` / `.toggleStyle`.
- `View.neumorphicShadow()` — adds the soft shadow to any view; purely additive on top of your own fill.
- Palette-agnostic — your colors, injected once.
- Bundled preview renders the styles standalone.

## Requirements
iOS 15 · Swift 5.9

## Installation
```swift
.package(url: "https://github.com/A-bv/NeumorphicSwiftUI", from: "1.0.0")
```

## Usage
Inject your palette once, at launch:
```swift
NeumorphicTheme.configure(NeumorphicPalette(
    gradientStart: .myLight,
    gradientEnd: .myDark,
    lowerShadow: .myLowerShadow,
    upperShadow: .myUpperShadow,
    highlightStroke: .myAccent,
    baseStroke: .myBase,
    background: .myBackground))
```
Then style anything:
```swift
Button("Send") {}.buttonStyle(ColorfulButtonStyle())
Toggle("Dark", isOn: $isOn).toggleStyle(DarkToggleStyle())
Circle().fill(Color.cardFill).neumorphicShadow()
```

> Set the palette before any styled view appears. Xcode previews must call `configure` themselves; the bundled preview shows how.
