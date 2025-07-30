// swift-tools-version:5.10
import PackageDescription

let package = Package(
    name: "COSTouchVisualizer",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "COSTouchVisualizer",
            targets: ["COSTouchVisualizer"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "COSTouchVisualizer",
            publicHeadersPath: "include"
        ),
    ]
)
