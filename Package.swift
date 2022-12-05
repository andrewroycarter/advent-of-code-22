// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Advent22",
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", .upToNextMajor(from: "1.0.0")),
    ],
    targets: [
        .executableTarget(
            name: "Advent22",
            dependencies: [.product(name: "ArgumentParser", package: "swift-argument-parser")]),
        .testTarget(
            name: "Advent22Tests",
            dependencies: ["Advent22"],
            resources: [
                .copy("Inputs/day1.txt"),
                .copy("Inputs/day2.txt"),
                .copy("Inputs/day3.txt")
            ]),
    ]
)
