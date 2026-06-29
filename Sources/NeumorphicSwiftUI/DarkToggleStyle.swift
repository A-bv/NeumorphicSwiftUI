import SwiftUI

public struct DarkToggleStyle: ToggleStyle {
    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        let shape = RoundedRectangle(cornerRadius: NeumorphicMetrics.cornerRadius)
        return Button(action: { configuration.isOn.toggle() }) {
            configuration.label
                .padding(10)
                .contentShape(shape)
        }
        .background(ColorfulBackgroundView(isHighlighted: configuration.isOn, shape: shape))
        // Re-expose the switch semantics that wrapping the toggle in a Button would
        // otherwise drop: the on/off value everywhere, plus the toggle trait on iOS 17+.
        .accessibilityValue(configuration.isOn ? Text("On") : Text("Off"))
        .accessibilityAddTraits(toggleTraits)
    }

    private var toggleTraits: AccessibilityTraits {
        if #available(iOS 17.0, macOS 14.0, *) { .isToggle } else { [] }
    }
}
