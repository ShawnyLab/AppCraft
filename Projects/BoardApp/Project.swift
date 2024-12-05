import ProjectDescription

let project = Project(
    name: "BoardApp",
    packages: [
        .remote(
            url: "https://github.com/pointfreeco/swift-composable-architecture",
            requirement: .upToNextMajor(from: "1.8.0")
        )
    ],
    targets: [
        Target(
            name: "FeatureBoard",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.featureboard",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Sources/Feature/**"],
            dependencies: [
                .project(target: "AppCraftCoreUI", path: "../Core"),
                .target(name: "DomainBoardInterface"),
                .package(product: "ComposableArchitecture"),
            ]
        ),
        Target(
            name: "DomainBoard",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.domainboard",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Sources/Domain/**"],
            dependencies: [
                .target(name: "DomainBoardInterface"),
                .target(name: "BoardRepository")
            ]
        ),
        Target(
            name: "DomainBoardInterface",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.domainboardinterface",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Sources/DomainInterface/**"],
            dependencies: [
                .project(target: "CoreDatabase", path: "../Core"),
                .project(target: "Shared", path: "../Core"),
            ]
        ),
        Target(
            name: "BoardRepository",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.boardrepository",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Sources/Repository/**"],
            dependencies: [
                .project(target: "CoreDatabase", path: "../Core"),
                .project(target: "Shared", path: "../Core"),
            ]
        ),
        Target(
            name: "MockDomainBoard",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.mockdomainboard",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Sources/Mock/**"],
            dependencies: [
                .target(name: "DomainBoardInterface")
            ]
        ),
        Target(
            name: "FeatureBoardExample",
            platform: .iOS,
            product: .app,
            bundleId: "com.appcraft.featureboardexample",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .file(path: "Sources/Example/Resources/Info.plist"),
            sources: ["Sources/Example/**"],
            dependencies: [
                .target(name: "FeatureBoard"),
                .target(name: "MockDomainBoard"),
                .target(name: "DomainBoardInterface")
            ],
            settings: .settings(
                base: [
                    "DEVELOPMENT_TEAM": "JRXGXW25BG"
                ]
            )
        )
    ]
)
