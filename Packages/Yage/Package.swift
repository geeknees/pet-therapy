// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "Yage",
    platforms: [.macOS(.v11), .iOS(.v15)],
    products: [
        .library(
            name: "Yage",
            targets: ["Yage"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/curzel-it/notagif", from: "1.0.7"),
        .package(url: "https://github.com/curzel-it/schwifty", from: "1.0.11")
    ],
    targets: [
        .target(
            name: "Yage",
            dependencies: [
                .product(name: "NotAGif", package: "NotAGif"),
                .product(name: "Schwifty", package: "Schwifty")
            ]
        ),
        .testTarget(
            name: "YageTests",
            dependencies: ["Yage"]
        )
    ]
)
