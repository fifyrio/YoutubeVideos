// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Root",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Root",
            targets: ["Root"]),
    ],
    dependencies: [
        .package(name: "Env", path: "../Env"),
        .package(name: "HomeComponents", path: "../HomeComponents"),
        .package(name: "MeComponents", path: "../MeComponents")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Root",
            dependencies: ["Env", "HomeComponents", "MeComponents"]
        ),
        .testTarget(
            name: "RootTests",
            dependencies: ["Root"]),
    ]
)
