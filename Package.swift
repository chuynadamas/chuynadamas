// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "Lazzaro",
    products: [
        .executable(
            name: "Lazzaro",
            targets: ["Lazzaro"]
        )
    ],
    dependencies: [
        .package(name: "Publish", url: "https://github.com/johnsundell/publish.git", from: "0.7.0")
    ],
    targets: [
        .target(
            name: "Lazzaro",
            dependencies: ["Publish"]
        )
    ]
)