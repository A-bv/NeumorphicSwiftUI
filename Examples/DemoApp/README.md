# DemoApp

A one-screen tour of everything in the package. [`DemoView.swift`](DemoView.swift) is a
single, self-contained file. It injects one palette, then shows each style once, each in
its own small struct so you can copy the piece you need.

## What you can use
The package gives you three styles, plus one palette that colors them all:

- **`NeumorphicButtonStyle`**, applied with `.buttonStyle(...)`. A normal SwiftUI `Button`
  that presses in while your finger is down, then springs back.
- **`NeumorphicToggleStyle`**, applied with `.toggleStyle(...)`. A normal SwiftUI `Toggle`
  that stays pressed in while it is on.
- **`neumorphicShadow()`**, on any view, for the soft raised shadow.
- **`NeumorphicPalette(surface:)`**, injected with `.neumorphicTheme(...)`, which builds
  every shade from one color.

## What is the toggle?
It is SwiftUI's built-in `Toggle` (an on/off switch) with the neumorphic look applied.
You bind it to your own `Bool`, and it holds its state until tapped again. That is the
difference from the button, which only looks pressed while you hold it.

## Can I tint the buttons?
Yes, in three independent ways:

1. The **label**: color the icon or text with `.foregroundStyle(...)`. The demo tints the
   paperplane blue.
2. The **pressed outline**: pass `accent:` to the palette.
3. The **whole surface**: pass any color as `surface:`.

## Run it
1. Create a new iOS App in Xcode.
2. Add this package: **File > Add Package Dependencies**, then paste
   `https://github.com/A-bv/NeumorphicSwiftUI`.
3. Drop `DemoView.swift` into the app target.
4. Use `DemoView()` as the app's root view (replace the generated `ContentView` with it,
   or put it in the `WindowGroup`).
