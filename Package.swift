// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "emojidataios",
    platforms: [
        .iOS(.v11),
    ],
    products: [
        .library(
            name: "emojidataios",
            targets: [
                "emojidataios",
            ]
        ),
    ],
    targets: [
        .target(
            name: "emojidataios",
            path: "emojidataios",
            resources: [
                .process("Assets/emojilist.json"),
            ]
        ),
    ]
)
