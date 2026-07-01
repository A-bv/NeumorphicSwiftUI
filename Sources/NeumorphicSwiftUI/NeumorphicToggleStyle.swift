import SwiftUI

public struct NeumorphicToggleStyle: ToggleStyle {
    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        let shape = RoundedRectangle(cornerRadius: NeumorphicMetrics.cornerRadius)
        return Button(action: { configuration.isOn.toggle() }) {
            configuration.label
                .padding(10)
                .contentShape(shape)
        }
        // Strip the default button tint and press-dim so the neumorphic background is
        // the only styling, matching how NeumorphicButtonStyle renders its label.
        .buttonStyle(.plain)
        .background(NeumorphicBackgroundView(isHighlighted: configuration.isOn, shape: shape))
        // Re-expose the switch semantics that wrapping the toggle in a Button would
        // otherwise drop: the on/off value everywhere, plus the toggle trait on iOS 17+.
        .accessibilityValue(configuration.isOn ? Text("On") : Text("Off"))
        .accessibilityAddTraits(toggleTraits)
    }

    private var toggleTraits: AccessibilityTraits {
        if #available(iOS 17.0, macOS 14.0, *) { .isToggle } else { [] }
    }
}

@available(*, deprecated, renamed: "NeumorphicToggleStyle")
public typealias DarkToggleStyle = NeumorphicToggleStyle
