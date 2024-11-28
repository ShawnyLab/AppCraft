import ProjectDescription
import ProjectDescriptionHelpers
import MyPlugin

// MARK: - Project

// Local plugin loaded
let localHelper = LocalHelper(name: "MyPlugin")


let settings: Settings = .settings(
    base: [
        "DEVELOPMENT_TEAM": "JRXGXW25BG",
    ]
)

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
            infoPlist: .file(path: "Targets/AppCraft/Resources/info.plist"),
            sources: ["Targets/AppCraft/Sources/**"],
            resources: [
                "Targets/CoreUI/Resources/**",
                "Targets/AppCraft/Resources/GoogleService-Info.plist",
                "Targets/AppCraft/Resources/info.plist"
            ],
            dependencies: [
                .target(name: "CoreDatabase"),
                .target(name: "Feature"),
                .target(name: "Domain")
            ],
            settings: settings
        ),
        Target(
            name: "Domain",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.domain",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Targets/Domain/Sources/**"],
            dependencies: [
                .target(name: "DomainBoard"),
                .target(name: "DomainComp"),
                .target(name: "DomainAuth")
            ]
        ),
        Target(
            name: "DomainBoard",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.domainboard",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Targets/DomainBoard/Sources/**"],
            dependencies: [
                .target(name: "CoreDatabase"),
                .target(name: "Shared")
            ]
        ),
        Target(
            name: "DomainComp",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.domaincomp",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Targets/DomainComp/Sources/**"],
            dependencies: [
                .target(name: "CoreDatabase"),
                .target(name: "Shared"),
//                .target(name: "DomainAuthInterface")
                .target(name: "DomainAuth")
            ]
        ),
        Target(
            name: "DomainAuth",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.domainauth",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Targets/DomainAuth/Sources/**"],
            dependencies: [
                .target(name: "CoreDatabase"),
                .target(name: "Shared"),
//                .target(name: "DomainAuthInterface"),
//                .package(product: "ComposableArchitecture"),
            ]
        ),
//        Target(
//            name: "DomainAuthInterface",
//            platform: .iOS,
//            product: .framework,
//            bundleId: "com.appcraft.domainauthinterface",
//            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
//            infoPlist: .default,
//            sources: ["Targets/DomainAuthInterface/Sources/**"],
//            dependencies: [
//                .target(name: "Shared"),
//            ]
//        ),
        Target(
            name: "Feature",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.feature",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Targets/Feature/Sources/**"],
            dependencies: [
                .target(name: "FeatureComp"),
                .target(name: "FeatureBoard"),
                .target(name: "FeatureAuth"),
            ]
        ),
        Target(
            name: "FeatureComp",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.featurecomp",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Targets/FeatureComp/Sources/**"],
            dependencies: [
                .target(name: "DomainComp"),
                .target(name: "CoreUI"),
                .package(product: "ComposableArchitecture"),
            ]
        ),
        Target(
            name: "FeatureAuthExample",
            platform: .iOS,
            product: .app,
            bundleId: "com.appcraft.featureauthexample",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .file(path: "Targets/FeatureAuthExample/Resources/Info.plist"),
            sources: ["Targets/FeatureAuthExample/Sources/**"],
            dependencies: [
                .target(name: "FeatureAuth")
            ],
            settings: settings
        ),
        Target(
            name: "FeatureAuth",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.featureauth",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Targets/FeatureAuth/Sources/**"],
            dependencies: [
                .target(name: "DomainAuth"),
                .target(name: "CoreUI"),
                .package(product: "ComposableArchitecture"),

            ]
        ),
        Target(
            name: "FeatureBoard",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.featureboard",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Targets/FeatureBoard/Sources/**"],
            dependencies: [
                .target(name: "DomainBoard"),
                .target(name: "FeatureComp"),
                .target(name: "CoreUI"),
                .package(product: "ComposableArchitecture"),
            ]
        ),
        Target(
            name: "CoreDatabase",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.coredatabase",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Targets/CoreDatabase/Sources/**"],
            dependencies: [
                .target(name: "Shared"),
                .package(product: "FirebaseFirestore"),
                .package(product: "FirebaseAuth"),
            ]
        ),
        Target(
            name: "CoreUI",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.coreui",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Targets/CoreUI/Sources/**"],
            resources: ["Targets/CoreUI/Resources/**"],
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
            sources: ["Targets/Shared/Sources/**"]
        ),
    ]
)
