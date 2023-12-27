// swift-tools-version: 5.8
import PackageDescription

let package = Package(
    name: "skip-vault",
    defaultLocalization: "en",
    platforms: [.iOS(.v16), .macOS(.v13), .tvOS(.v16), .watchOS(.v9), .macCatalyst(.v16)],
    products: [
    .library(name: "SkipVault", targets: ["SkipVault"]),
    ],
    dependencies: [
        .package(url: "https://source.skip.tools/skip.git", from: "0.7.38"),
        .package(url: "https://source.skip.tools/skip-foundation.git", from: "0.3.11"),
    ],
    targets: [
    .target(name: "SkipVault", dependencies: [.product(name: "SkipFoundation", package: "skip-foundation")], plugins: [.plugin(name: "skipstone", package: "skip")]),
    .testTarget(name: "SkipVaultTests", dependencies: [
        "SkipVault",
        .product(name: "SkipTest", package: "skip")
    ], plugins: [.plugin(name: "skipstone", package: "skip")]),
    ]
)
