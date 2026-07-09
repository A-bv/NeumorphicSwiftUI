# ``NeumorphicSwiftUI``

Soft neumorphic button, toggle, and surface styles for SwiftUI, themed by your palette.

## Overview

NeumorphicSwiftUI gives you the pressed-and-raised neumorphic look as plain SwiftUI
styles you apply with a single modifier. It ships no colors of its own: you inject a
``NeumorphicPalette`` through the environment with ``SwiftUICore/View/neumorphicTheme(_:)``,
so it fits any app's design system.

```swift
ContentView()
    .neumorphicTheme(myPalette)

// then, anywhere in that subtree:
Button("Send") {}.buttonStyle(NeumorphicButtonStyle())
Toggle("Dark", isOn: $isOn).toggleStyle(NeumorphicToggleStyle())
Circle().fill(Color.cardFill).neumorphicShadow()
```

Without a theme the styles fall back to ``NeumorphicPalette``'s defaults, which show
the effect on a light surface.

## Topics

### Styles

- ``NeumorphicButtonStyle``
- ``NeumorphicToggleStyle``

### Theming

- ``NeumorphicPalette``
- ``SwiftUICore/View/neumorphicTheme(_:)``

### Shadows

- ``SwiftUICore/View/neumorphicShadow()``
