// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Purdue-App-API-Models",
    platforms: [.macOS(.v10_13), .iOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Purdue-App-API-Models",
            targets: ["Purdue-App-API-Models"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Purdue-App-API-Models",
            dependencies: []),
        .testTarget(
            name: "Purdue-App-API-ModelsTests",
            dependencies: ["Purdue-App-API-Models"]),
    ]
)
