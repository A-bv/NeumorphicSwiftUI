import SwiftUI
import NeumorphicSwiftUI

// A one-screen tour of the package. It injects one palette, then shows each style once,
// each in its own small struct so you can see exactly how it is used.
//
// To run it, add NeumorphicSwiftUI to an iOS app via Swift Package Manager, drop this
// file in, and use `DemoView()` as the app's root view.
struct DemoView: View {
    // One surface color builds the whole palette.
    private let surface = Color(red: 0.878, green: 0.898, blue: 0.925)

    var body: some View {
        VStack(spacing: 44) {
            ButtonExample()
            ToggleExample()
            ShadowExample(surface: surface)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(surface)
        .neumorphicTheme(NeumorphicPalette(surface: surface))
    }
}

// A normal SwiftUI Button with the neumorphic style. It presses in while your finger is
// down, then springs back. The label is yours, so tint the icon however you like.
struct ButtonExample: View {
    var body: some View {
        Button {
            // Put your action here.
        } label: {
            Image(systemName: "paperplane.fill")
                .font(.title)
                .foregroundStyle(.blue)
        }
        .buttonStyle(NeumorphicButtonStyle())
    }
}

// A normal SwiftUI Toggle (an on/off switch) with the neumorphic style. Unlike the
// button, it stays pressed in while it is on, until you tap it again. Bind it to your
// own Bool state.
struct ToggleExample: View {
    @State private var isOn = false

    var body: some View {
        Toggle(isOn: $isOn) {
            Image(systemName: "moon.fill").font(.title)
        }
        .toggleStyle(NeumorphicToggleStyle())
        .labelsHidden()
    }
}

// Any view can get the soft raised shadow with neumorphicShadow().
struct ShadowExample: View {
    let surface: Color

    var body: some View {
        Circle()
            .fill(surface)
            .neumorphicShadow()
            .frame(width: 110, height: 110)
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        DemoView()
    }
}
