// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "google-cloud",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "GoogleCloud",
            targets: ["GoogleCloud"]),
        .library(
            name: "CloudStorage",
            targets: ["CloudStorage"]),
        .library(
            name: "CloudDatastore",
            targets: ["CloudDatastore"]),
        .library(
            name: "CloudSecretManager",
            targets: ["CloudSecretManager"]),
        .library(
            name: "CloudTranslation",
            targets: ["CloudTranslation"]),
        .library(
            name: "CloudPubSub",
            targets: ["CloudPubSub"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
        .package(url: "git@github.com:Clearcals/google-cloud-kit.git", .branch("master"))
    ],
    targets: [
        .target(
            name: "GoogleCloud",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "GoogleCloudKit", package: "google-cloud-kit"),
            ]),
        
        .target(
            name: "CloudStorage",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "GoogleCloudStorage", package: "google-cloud-kit"),
                .target(name: "GoogleCloud")
        ]),
        .target(
            name: "CloudDatastore",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "GoogleCloudDatastore", package: "google-cloud-kit"),
                .target(name: "GoogleCloud")
        ]),
        .target(
            name: "CloudSecretManager",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "GoogleCloudSecretManager", package: "google-cloud-kit"),
                .target(name: "GoogleCloud")
        ]),
        .target(
            name: "CloudTranslation",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "GoogleCloudTranslation", package: "google-cloud-kit"),
                .target(name: "GoogleCloud")
        ]),
        .target(
            name: "CloudPubSub",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "GoogleCloudPubSub", package: "google-cloud-kit"),
                .target(name: "GoogleCloud")
        ]),
    ]
)
