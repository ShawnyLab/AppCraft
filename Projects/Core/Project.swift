import ProjectDescription

let project = Project(
    name: "Core",
    packages: [
        .remote(
            url: "https://github.com/firebase/firebase-ios-sdk",
            requirement: .branch("main")
        )
    ],
    targets: [
        Target(
            name: "CoreAuth",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.coreauth",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Sources/CoreAuth/**"],
            dependencies: [
                .target(name: "Shared"),
                .package(product: "FirebaseAuth")
            ]
        ),
        Target(
            name: "CoreDatabase",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.coredatabase",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Sources/CoreDatabase/**"],
            dependencies: [
                .target(name: "Shared"),
                .package(product: "FirebaseFirestore")
            ]
        ),
        Target(
            name: "AppCraftCoreUI",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.appcraftcoreui",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Sources/AppCraftCoreUI/**"],
            resources: ["Sources/AppCraftCoreUI/Resources/**"],
            dependencies: [
                .target(name: "Shared"),
            ]
        ),
        Target(
            name: "Shared",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.shared",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Sources/Shared/**"]
        )
    ]
)
