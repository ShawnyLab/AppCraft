import ProjectDescription

let project = Project(
    name: "BoardApp",
    targets: [
        .target(
            name: "FeatureBoard",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.appcraft.featureboard",
            infoPlist: .default,
            sources: ["Sources/Feature/**"],
            dependencies: [
                .project(target: "AppCraftCoreUI", path: "../Core"),
                .target(name: "DomainBoardInterface"),
                .external(name: "ComposableArchitecture"),
            ]
        ),
        .target(
            name: "DomainBoard",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.appcraft.domainboard",
            infoPlist: .default,
            sources: ["Sources/Domain/**"],
            dependencies: [
                .target(name: "DomainBoardInterface"),
                .target(name: "BoardRepository")
            ]
        ),
        .target(
            name: "DomainBoardInterface",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.appcraft.domainboardinterface",
            infoPlist: .default,
            sources: ["Sources/DomainInterface/**"],
            dependencies: [
                .project(target: "CoreDatabase", path: "../Core"),
                .project(target: "Shared", path: "../Core"),
            ]
        ),
        .target(
            name: "BoardRepository",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.appcraft.boardrepository",
            infoPlist: .default,
            sources: ["Sources/Repository/**"],
            dependencies: [
                .project(target: "CoreDatabase", path: "../Core"),
                .project(target: "Shared", path: "../Core"),
            ]
        ),
        .target(
            name: "MockDomainBoard",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.appcraft.mockdomainboard",
            infoPlist: .default,
            sources: ["Sources/Mock/**"],
            dependencies: [
                .target(name: "DomainBoardInterface")
            ]
        ),
        .target(
            name: "FeatureBoardExample",
            destinations: .iOS,
            product: .app,
            bundleId: "com.appcraft.featureboardexample",
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
