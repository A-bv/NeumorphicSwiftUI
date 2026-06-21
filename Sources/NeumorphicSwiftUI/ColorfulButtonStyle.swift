import SwiftUI

public struct ColorfulButtonStyle: ButtonStyle {
    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(10)
            .contentShape(Circle())
            .background(
                ColorfulBackgroundView(
                    isHighlighted: configuration.isPressed,
                    shape: RoundedRectangle(cornerRadius: 10)))
            .animation(nil, value: configuration.isPressed)
    }
}
