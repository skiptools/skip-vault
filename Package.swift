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
        .package(url: "https://source.skip.tools/skip.git", from: "0.6.60"),
        .package(url: "https://source.skip.tools/skip-foundation.git", from: "0.1.20"),
    ],
    targets: [
    .target(name: "SkipVault", dependencies: [.product(name: "SkipFoundation", package: "skip-foundation", condition: .when(platforms: [.macOS]))], plugins: [.plugin(name: "skipstone", package: "skip")]),
    .testTarget(name: "SkipVaultTests", dependencies: [
        "SkipVault",
        .product(name: "SkipTest", package: "skip", condition: .when(platforms: [.macOS]))
    ], plugins: [.plugin(name: "skipstone", package: "skip")]),
    ]
)
