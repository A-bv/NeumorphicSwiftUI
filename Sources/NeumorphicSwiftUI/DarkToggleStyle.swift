import SwiftUI

public struct DarkToggleStyle: ToggleStyle {
    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        Button(action: { configuration.isOn.toggle() }) {
            configuration.label
                .padding(10)
                .contentShape(Circle())
        }
        .background(
            ColorfulBackgroundView(
                isHighlighted: configuration.isOn,
                shape: RoundedRectangle(cornerRadius: 10)))
    }
}
