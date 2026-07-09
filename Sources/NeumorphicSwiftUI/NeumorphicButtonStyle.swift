import SwiftUI

public struct NeumorphicButtonStyle: ButtonStyle {
    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        let shape = RoundedRectangle(cornerRadius: NeumorphicMetrics.cornerRadius)
        return configuration.label
            .padding(10)
            .contentShape(shape)
            .background(NeumorphicBackgroundView(isHighlighted: configuration.isPressed, shape: shape))
            .animation(nil, value: configuration.isPressed)
    }
}

@available(*, deprecated, renamed: "NeumorphicButtonStyle")
public typealias ColorfulButtonStyle = NeumorphicButtonStyle
