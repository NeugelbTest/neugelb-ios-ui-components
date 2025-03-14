// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NeugelbUIComponents",
    platforms: [
        .iOS(.v15),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "NeugelbUIComponents",
            targets: ["NeugelbUIComponents"])
    ],
    dependencies: [
        .package(url: "https://github.com/NeugelbTest/neugelb-ios-fonts", branch: "main"),
        .package(url: "https://github.com/NeugelbTest/neugelb-ios-colors", branch: "main"),
        .package(url: "https://github.com/NeugelbTest/neugelb-ios-images", branch: "feature/addMovieList"),
        .package(url: "https://github.com/NeugelbTest/neugelb-ios-network", branch: "feature/addMovieService"),
        .package(url: "https://github.com/ciaranrobrien/SwiftUIScrollOffset", .upToNextMajor(from: "1.3.0"))
    ],
    targets: [
        .target(
            name: "NeugelbUIComponents",
            dependencies: [
                .product(name: "NeugelbFonts", package: "neugelb-ios-fonts"),
                .product(name: "NeugelbColors", package: "neugelb-ios-colors"),
                .product(name: "NeugelbImages", package: "neugelb-ios-images"),
                .product(name: "NeugelbNetwork", package: "neugelb-ios-network"),
                .product(name: "SwiftUIScrollOffset", package: "SwiftUIScrollOffset")
            ],
            path: "./Sources"
        ),
        .testTarget(
            name: "NeugelbUIComponentsTests",
            dependencies: ["NeugelbUIComponents"]
        )
    ]
)
