// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "SwiftyNotify",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13),
        .macOS(.v10_15) // Include this if you want to support Mac Catalyst
    ],
    products: [
        .library(
            name: "SwiftyNotify",
            targets: ["SwiftyNotify"]),
    ],
    dependencies: [
        // Add any external dependencies here
    ],
    targets: [
        .target(
            name: "SwiftyNotify",
            dependencies: []),
        .testTarget(
            name: "SwiftyNotifyTests",
            dependencies: ["SwiftyNotify"]),
    ]
)
