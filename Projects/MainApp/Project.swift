import ProjectDescription

let project = Project(
    name: "MainApp",
    packages: [
//        .remote(
//            url: "https://github.com/pointfreeco/swift-composable-architecture",
//            requirement: .upToNextMajor(from: "1.8.0")
//        ),
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
            infoPlist: .file(path: "Sources/Info.plist"),
            sources: ["Sources/**"],
            resources: [
                "Sources/Resources/**",
                "Sources/Resources/GoogleService-Info.plist",
            ],
            dependencies: [
                // Features
                .project(target: "FeatureBoard", path: "../BoardApp"),
                .project(target: "DomainBoard", path: "../BoardApp"),
                .project(target: "DomainBoardInterface", path: "../BoardApp"),
                .project(target: "BoardRepository", path: "../BoardApp"),
                
                // Core
                .project(target: "CoreDatabase", path: "../Core"),
                .project(target: "AppCraftCoreUI", path: "../Core"),
                .project(target: "Shared", path: "../Core"),
                
                // Package
//                .package(product: "ComposableArchitecture"),
                .package(product: "FirebaseCore"),
            ],
            settings: .settings(
                base: [
                    "DEVELOPMENT_TEAM": "JRXGXW25BG"
                ]
            )
        )
    ]
)
