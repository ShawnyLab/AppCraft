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
        ),
        .remote(
            url: "https://github.com/google/GoogleSignIn-iOS.git",
            requirement: .upToNextMajor(from: "7.0.0")
        ),
    ],
    targets: [
        Target(
            name: "FeatureAuthExample",
            platform: .iOS,
            product: .app,
            bundleId: "com.appcraft.featureauthexample",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Sources/Example/**"],
            dependencies: [
                .target(name: "FeatureAuth"),
                .target(name: "MockDomainAuth"),
                .target(name: "DomainAuthInterface"),
                .package(product: "FirebaseCore"),
                .package(product: "GoogleSignIn"),
            ],
            settings: .settings(
                base: [
                    "DEVELOPMENT_TEAM": "JRXGXW25BG"
                ]
            )
        ),
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
                .target(name: "UserRepository")
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
                .project(target: "CoreAuth", path: "../Core"),
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
                .project(target: "CoreDatabase", path: "../Core"),
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
        )
    ]
)
