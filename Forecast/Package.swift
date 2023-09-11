// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Forecast",
    defaultLocalization: "en",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Forecast",
            targets: ["Forecast"]),
    ],
    dependencies: [
        .package(path: "Network"),
        .package(path: "Core"),
        .package(path: "Design"),
        .package(url: "https://github.com/airbnb/lottie-spm.git", from: "4.2.0")
    ],
    targets: [
        .target(
            name: "Forecast",
            dependencies: [
                .product(name: "Network", package: "Network"),
                .product(name: "Core", package: "Core"),
                .product(name: "Design", package: "Design"),
                .product(name: "Lottie", package: "lottie-spm"),
            ]
        ),
        .testTarget(
            name: "ForecastTests",
            dependencies: ["Forecast"]),
    ]
)
