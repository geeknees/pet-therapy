// swift-tools-version: 5.7.1

import PackageDescription

let package = Package(
    name: "Tracking",
    platforms: [.macOS(.v11), .iOS(.v15)],
    products: [
        .library(
            name: "Tracking",
            targets: ["Tracking"]
        )
    ],
    dependencies: [
        .package(path: "../Pets"),
        .package(url: "https://github.com/curzel-it/schwifty", from: "1.0.13"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "8.15.0")
    ],
    targets: [
        .target(
            name: "Tracking",
            dependencies: [
                .product(name: "FirebaseAnalyticsWithoutAdIdSupport", package: "firebase-ios-sdk"),
                .product(name: "FirebaseCrashlytics", package: "firebase-ios-sdk"),
                .product(name: "FirebaseInstallations", package: "firebase-ios-sdk"),
                .product(name: "FirebaseRemoteConfig", package: "firebase-ios-sdk"),
                .product(name: "Pets", package: "Pets"),
                .product(name: "Schwifty", package: "Schwifty")
            ]
        )
    ]
)
