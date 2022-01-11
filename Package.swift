// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "TMDb",

    platforms: [
        .macOS(.v10_15), .iOS(.v15), .tvOS(.v15), .watchOS(.v8)
    ],

    products: [
        .library(name: "TMDb", targets: ["TMDb"])
    ],

    dependencies: [
        .package(name: "APIClient", path: "../../APIClient"),
//        .package(name: "APIClient", url: "https://github.com/adamayoung/APIClient.git", branch: "main"),
        .package(url: "https://github.com/WeTransfer/Mocker.git", .upToNextMajor(from: "2.3.0"))
    ],

    targets: [
        .target(
            name: "TMDb",
            dependencies: ["APIClient"]
        ),
        .testTarget(
            name: "TMDbTests",
            dependencies: ["TMDb", "APIClient", "Mocker"],
            resources: [
                .process("Resources")
            ]
        )
    ]
)
