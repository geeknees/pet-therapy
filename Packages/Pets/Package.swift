// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "Pets",
    platforms: [.macOS(.v11), .iOS(.v15)],
    products: [
        .library(
            name: "Pets",
            targets: ["Pets"]
        )
    ],
    dependencies: [
        .package(path: "../DesignSystem"),
        .package(path: "../Yage"),
        .package(url: "https://github.com/curzel-it/notagif", from: "1.0.4"),
        .package(url: "https://github.com/curzel-it/schwifty", from: "1.0.11")
    ],
    targets: [
        .target(
            name: "Pets",
            dependencies: [
                .product(name: "DesignSystem", package: "DesignSystem"),
                .product(name: "NotAGif", package: "NotAGif"),
                .product(name: "Schwifty", package: "Schwifty"),
                .product(name: "Yage", package: "Yage")
            ],
            resources: [
                .copy("Assets")
            ]

        ),
        .testTarget(
            name: "PetsTests",
            dependencies: ["Pets"]
        )
    ]
)
