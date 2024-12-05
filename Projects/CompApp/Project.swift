import ProjectDescription

let project = Project(
    name: "CompApp",
    packages: [
        .remote(
            url: "https://github.com/pointfreeco/swift-composable-architecture",
            requirement: .upToNextMajor(from: "1.8.0")
        )
    ],
    targets: [
        Target(
            name: "FeatureComp",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.featurecomp",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Sources/Feature/**"],
            dependencies: [
                .target(name: "DomainCompInterface"),
                .project(target: "AppCraftCoreUI", path: "../Core"),
                .package(product: "ComposableArchitecture"),
            ]
        ),
        Target(
            name: "DomainComp",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.domaincomp",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Sources/Domain/**"],
            dependencies: [
                .target(name: "DomainCompInterface"),
                .target(name: "CompRepository")
            ]
        ),
        Target(
            name: "DomainCompInterface",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.domaincompinterface",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Sources/DomainInterface/**"],
            dependencies: [
                .project(target: "CoreDatabase", path: "../Core"),
                .project(target: "Shared", path: "../Core"),
            ]
        ),
        Target(
            name: "CompRepository",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.comprepository",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Sources/Repository/**"],
            dependencies: [
                .project(target: "CoreDatabase", path: "../Core"),
                .project(target: "Shared", path: "../Core"),
            ]
        ),
        Target(
            name: "MockDomainComp",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.mockdomaincomp",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Sources/Mock/**"],
            dependencies: [
                .target(name: "DomainCompInterface")
            ]
        ),
        Target(
            name: "FeatureCompExample",
            platform: .iOS,
            product: .app,
            bundleId: "com.appcraft.featurecompexample",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
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
