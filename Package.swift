// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DJIWidget",
    platforms: [.iOS(.v9)],
    products: [
        .library(
            name: "DJIWidget",
            targets: ["DJIWidget"]
        ),
        .library(
            name: "FFmpeg",
            targets: ["FFmpeg"]
        )
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "DJIWidget",
            path: "XCFrameworks/DJIWidget.xcframework"
        ),
        .binaryTarget(
            name: "FFmpeg",
            path: "XCFrameworks/FFmpeg.xcframework"
        )
    ]
)
