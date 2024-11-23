// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "View-bubblify",
    platforms: [.macOS(.v10_15), .iOS(.v13), .watchOS(.v6)],
    products: [
        .library(
            name: "View-bubblify",
            targets: ["View-bubblify"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "View-bubblify",
            dependencies: []
        ),
        .testTarget(
            name: "View-bubblify-tests",
            dependencies: ["View-bubblify"]
        ),
    ]
)
