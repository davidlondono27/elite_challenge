// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FeatureDemo",
    defaultLocalization: "es",
    platforms: [.iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "FeatureDemo",
            targets: ["FeatureDemo"])
    ],
    dependencies: [
        .package(path: "../TestingUtilities"),
        .package(path: "../Theme"),
        .package(path: "../LocalizedStrings"),
        .package(path: "../Common"),
        .package(path: "../elite-iosUI")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "FeatureDemo",
            dependencies: [
                "Theme",
                "LocalizedStrings",
                "Common",
                .product(name: "eliteiosUI", package: "elite-iosui")
            ],
            resources: [],
            plugins: []
        ),
        .testTarget(
            name: "FeatureDemoTests",
            dependencies: [
                "FeatureDemo",
                "TestingUtilities"
            ]
        )
    ]
)
