// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "NeumorphicSwiftUI",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "NeumorphicSwiftUI", targets: ["NeumorphicSwiftUI"]),
    ],
    targets: [
        .target(name: "NeumorphicSwiftUI"),
    ]
)
