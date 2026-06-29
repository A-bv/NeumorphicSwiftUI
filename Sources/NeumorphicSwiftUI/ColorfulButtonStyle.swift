import SwiftUI

public struct ColorfulButtonStyle: ButtonStyle {
    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        let shape = RoundedRectangle(cornerRadius: NeumorphicMetrics.cornerRadius)
        return configuration.label
            .padding(10)
            .contentShape(shape)
            .background(ColorfulBackgroundView(isHighlighted: configuration.isPressed, shape: shape))
            .animation(nil, value: configuration.isPressed)
    }
}
