import ProjectDescription

let project = Project(
    name: "CompApp",
    packages: [
//        .remote(
//            url: "https://github.com/pointfreeco/swift-composable-architecture",
//            requirement: .upToNextMajor(from: "1.8.0")
//        )
    ],
    targets: [
        .target(
            name: "FeatureComp",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.appcraft.featurecomp",
            infoPlist: .default,
            sources: ["Sources/Feature/**"],
            dependencies: [
                .target(name: "DomainCompInterface"),
                .project(target: "AppCraftCoreUI", path: "../Core"),
//                .package(product: "ComposableArchitecture"),
            ]
        ),
        .target(
            name: "DomainComp",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.appcraft.domaincomp",
            infoPlist: .default,
            sources: ["Sources/Domain/**"],
            dependencies: [
                .target(name: "DomainCompInterface"),
                .target(name: "CompRepository")
            ]
        ),
        .target(
            name: "DomainCompInterface",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.appcraft.domaincompinterface",
            infoPlist: .default,
            sources: ["Sources/DomainInterface/**"],
            dependencies: [
                .project(target: "CoreDatabase", path: "../Core"),
                .project(target: "Shared", path: "../Core"),
            ]
        ),
        .target(
            name: "CompRepository",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.appcraft.comprepository",
            infoPlist: .default,
            sources: ["Sources/Repository/**"],
            dependencies: [
                .project(target: "CoreDatabase", path: "../Core"),
                .project(target: "Shared", path: "../Core"),
            ]
        ),
        .target(
            name: "MockDomainComp",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.appcraft.mockdomaincomp",
            infoPlist: .default,
            sources: ["Sources/Mock/**"],
            dependencies: [
                .target(name: "DomainCompInterface")
            ]
        ),
        .target(
            name: "FeatureCompExample",
            destinations: .iOS,
            product: .app,
            bundleId: "com.appcraft.featurecompexample",
            infoPlist: .file(path: "Sources/Example/Resources/Info.plist"),
            sources: ["Sources/Example/**"],
            dependencies: [
                .target(name: "FeatureComp"),
                .target(name: "MockDomainComp"),
                .target(name: "DomainCompInterface")
            ],
            settings: .settings(
                base: [
                    "DEVELOPMENT_TEAM": "JRXGXW25BG"
                ]
            )
        )
    ]
)
