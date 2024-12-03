import ProjectDescription

let project = Project(
    name: "AuthApp",
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
            name: "FeatureAuth",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.featureauth",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Sources/Feature/**"],
            dependencies: [
                .target(name: "DomainAuthInterface"),
                .project(target: "AppCraftCoreUI", path: "../Core"),
                .package(product: "ComposableArchitecture"),
            ]
        ),
        Target(
            name: "DomainAuth",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.domainauth",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Sources/Domain/**"],
            dependencies: [
                .target(name: "DomainAuthInterface"),
                .target(name: "UserRepositoryInterface")
            ]
        ),
        Target(
            name: "DomainAuthInterface",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.domainauthinterface",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Sources/DomainInterface/**"],
            dependencies: [
                .project(target: "CoreService", path: "../Core"),
                .project(target: "Shared", path: "../Core"),
            ]
        ),
        Target(
            name: "UserRepository",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.userrepository",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Sources/Repository/**"],
            dependencies: [
                .target(name: "UserRepositoryInterface"),
                .package(product: "FirebaseFirestore")
            ]
        ),
        Target(
            name: "UserRepositoryInterface",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.userrepositoryinterface",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Sources/RepositoryInterface/**"],
            dependencies: [
                .project(target: "CoreService", path: "../Core"),
                .project(target: "Shared", path: "../Core"),
            ]
        ),
        Target(
            name: "MockDomainAuth",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.mockdomainauth",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Sources/Mock/**"],
            dependencies: [
                .target(name: "DomainAuthInterface")
            ]
        ),
        Target(
            name: "FeatureAuthExample",
            platform: .iOS,
            product: .app,
            bundleId: "com.appcraft.featureauthexample",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .file(path: "Sources/Example/Resources/Info.plist"),
            sources: ["Sources/Example/**"],
            dependencies: [
                .target(name: "FeatureAuth"),
                .target(name: "MockDomainAuth"),
                .target(name: "DomainAuthInterface")
            ],
            settings: .settings(base: [:])
        )
    ]
)
