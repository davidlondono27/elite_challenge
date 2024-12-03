// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "elite-iosUI",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "elite-iosUI",
            targets: ["elite-iosUI"])
    ],
    dependencies: [
        .package(path: "../TestingUtilities")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "elite-iosUI",
            dependencies: [],
            plugins: []
        ),
        .testTarget(
            name: "elite-iosUITests",
            dependencies: [
                "elite-iosUI",
                "TestingUtilities"
            ]
        )
    ]
)
