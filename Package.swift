// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "semv",
    dependencies: [
        .package(name: "SwiftPM", url: "https://github.com/apple/swift-package-manager.git", from: "0.6.0"),
        .package(url: "https://github.com/apple/swift-tools-support-core.git", .upToNextMajor(from: "0.1.0")),
        .package(url: "https://github.com/apple/swift-argument-parser.git", .upToNextMinor(from: "0.3.0")),
    ],
    targets: [
        .target(
            name: "semv",
            dependencies: [ 
                .product(name: "PackageDescription", package: "SwiftPM"),
                .product(name: "SwiftToolsSupport-auto", package: "swift-tools-support-core"),
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]),
        .testTarget(
            name: "semvTests",
            dependencies: ["semv"]),
    ]
)
