import ProjectDescription

let project = Project(
    name: "Core",
    packages: [],
    targets: [
        Target(
            name: "CoreService",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.coreservice",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Sources/CoreService/**"],
            dependencies: [
                .target(name: "Shared"),
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
