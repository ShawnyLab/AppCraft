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
        .target(
            name: "FeatureAuthExample",
            destinations: .iOS,
            product: .app,
            bundleId: "com.appcraft.featureauthexample",
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
        .target(
            name: "FeatureAuth",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.appcraft.featureauth",
            infoPlist: .default,
            sources: ["Sources/Feature/**"],
            dependencies: [
                .target(name: "DomainAuthInterface"),
                .project(target: "AppCraftCoreUI", path: "../Core"),
//                .package(product: "ComposableArchitecture"),
            ]
        ),
        .target(
            name: "DomainAuth",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.appcraft.domainauth",
            infoPlist: .default,
            sources: ["Sources/Domain/**"],
            dependencies: [
                .target(name: "DomainAuthInterface"),
                .target(name: "UserRepository")
            ]
        ),
        .target(
            name: "DomainAuthInterface",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.appcraft.domainauthinterface",
            infoPlist: .default,
            sources: ["Sources/DomainInterface/**"],
            dependencies: [
                .project(target: "CoreAuth", path: "../Core"),
                .project(target: "Shared", path: "../Core"),
            ]
        ),
        .target(
            name: "UserRepository",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.appcraft.userrepository",
            infoPlist: .default,
            sources: ["Sources/Repository/**"],
            dependencies: [
                .project(target: "CoreDatabase", path: "../Core"),
                .project(target: "Shared", path: "../Core"),
            ]
        ),
        .target(
            name: "MockDomainAuth",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.appcraft.mockdomainauth",
            infoPlist: .default,
            sources: ["Sources/Mock/**"],
            dependencies: [
                .target(name: "DomainAuthInterface")
            ]
        )
    ]
)
