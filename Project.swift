import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin

/*
                +-------------+
                |             |
                |     App     | Contains AppCraft App target and AppCraft unit-test target
                |             |
         +------+-------------+-------+
         |         depends on         |
         |                            |
 +----v-----+                   +-----v-----+
 |          |                   |           |
 |   Kit    |                   |     UI    |   Two independent frameworks to share code and start modularising your app
 |          |                   |           |
 +----------+                   +-----------+

 */

// MARK: - Project

// Local plugin loaded
let localHelper = LocalHelper(name: "MyPlugin")

// Creates our project using a helper function defined in ProjectDescriptionHelpers
let project = Project(
    name: "AppCraft",
    packages: [
        .remote(
            url: "https://github.com/pointfreeco/swift-composable-architecture",
            requirement: .upToNextMajor(from: "1.8.0")
        ),
        .remote(
            url: "https://github.com/firebase/firebase-ios-sdk",
            requirement: .branch("main")
        )
    ],
    targets: [
        Target(
            name: "AppCraft",
            platform: .iOS,
            product: .app,
            bundleId: "com.indecode.appcraft",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Targets/AppCraft/Sources/**"],
            resources: [
                "Targets/CraftCoreUI/Resources/**",
                "Targets/AppCraft/Resources/GoogleService-Info.plist"
            ],
            dependencies: [
                .target(name: "AppCraftUI"),
                .target(name: "AppCraftDatabase")
            ]
        ),
        Target(
            name: "AppCraftUI",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.ui",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Targets/AppCraftUI/Sources/**"],
            dependencies: [
                .target(name: "BoardUI"),
                .target(name: "CraftCoreUI"),
                .target(name: "CompUI")
            ]
        ),
        Target(
            name: "AppCraftCore",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.core",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Targets/AppCraftCore/Sources/**"]
        ),
        Target(
            name: "AppCraftDatabase",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.database",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Targets/AppCraftDatabase/Sources/**"],
            dependencies: [
                .target(name: "AppCraftCore"),
                .package(product: "FirebaseCore"),
                .package(product: "FirebaseFirestore")
            ]
        ),
        Target(
            name: "BoardKit",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.boardkit",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Targets/BoardKit/Sources/**"],
            dependencies: [
                .package(product: "ComposableArchitecture"),
                .target(name: "AppCraftCore")
            ]
        ),
        Target(
            name: "BoardUI",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.boardui",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Targets/BoardUI/Sources/**"],
            dependencies: [
                .target(name: "AppCraftCore"),
                .target(name: "CraftCoreUI"),
                .target(name: "BoardKit"),
                .target(name: "CompUI")
            ]
        ),
        Target(
            name: "CraftCoreUI",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.craftcoreui",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Targets/CraftCoreUI/Sources/**"],
            resources: ["Targets/CraftCoreUI/Resources/**"],
            dependencies: [
                .target(name: "AppCraftCore")
            ]
        ),
        Target(
            name: "CompUI",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.compui",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Targets/CompUI/Sources/**"],
            resources: ["Targets/CraftCoreUI/Resources/**"],
            dependencies: [
                .target(name: "AppCraftCore"),
                .target(name: "CraftCoreUI"),
                .target(name: "CompKit")
            ]
        ),
        Target(
            name: "CompKit",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.compkit",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Targets/CompKit/Sources/**"],
            resources: ["Targets/CraftCoreUI/Resources/**"],
            dependencies: [
                .package(product: "ComposableArchitecture"),
                .target(name: "AppCraftCore")
            ]
        ),
    ]
)
