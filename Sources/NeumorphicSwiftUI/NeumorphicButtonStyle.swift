import SwiftUI

public struct NeumorphicButtonStyle: ButtonStyle {
    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        NeumorphicSurface(isHighlighted: configuration.isPressed) {
            configuration.label
        }
        .animation(nil, value: configuration.isPressed)
    }
}

@available(*, deprecated, renamed: "NeumorphicButtonStyle")
public typealias ColorfulButtonStyle = NeumorphicButtonStyle
