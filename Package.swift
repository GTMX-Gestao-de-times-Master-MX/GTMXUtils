// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GTMXUtils",
    platforms: [
        .macOS(.v10_14)
    ],
    products: [
        .library(
            name: "GTMXUtils",
            targets: ["GTMXUtils"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "GTMXUtils",
            dependencies: []),
        .testTarget(
            name: "GTMXUtilsTests",
            dependencies: ["GTMXUtils"]),
    ]
)
