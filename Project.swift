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
                "Targets/AppCraftCoreUI/Resources/**",
                "Targets/AppCraft/Resources/GoogleService-Info.plist",
                "Targets/AppCraft/Resources/info.plist"
            ],
            dependencies: [
                .target(name: "CoreService"),
                .target(name: "Feature"),
            ],
            settings: settings
        ),
//        Target(
//            name: "Domain",
//            platform: .iOS,
//            product: .framework,
//            bundleId: "com.appcraft.domain",
//            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
//            infoPlist: .default,
//            sources: ["Targets/Domain/Sources/**"],
//            dependencies: [
//                .target(name: "DomainBoard"),
//                .target(name: "DomainComp"),
//                .target(name: "DomainAuth"),
//                .target(name: "DomainBoardInterface"),
//                .target(name: "DomainCompInterface"),
//                .target(name: "DomainAuthInterface"),
//                .package(product: "ComposableArchitecture"),
//            ]
//        ),
        Target(
            name: "DomainBoard",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.domainboard",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Targets/DomainBoard/Sources/**"],
            dependencies: [
                .target(name: "Shared"),
                .target(name: "DomainBoardInterface"),
                .target(name: "DomainCompInterface")
            ]
        ),
        Target(
            name: "MockDomainBoard",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.mockdomainboard",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Targets/MockDomainBoard/Sources/**"],
            dependencies: [
                .target(name: "Shared"),
                .target(name: "DomainBoardInterface"),
                .target(name: "DomainCompInterface")
            ]
        ),
        Target(
            name: "DomainBoardInterface",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.domainboardinterface",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Targets/DomainBoardInterface/Sources/**"],
            dependencies: [
                .target(name: "CoreService"),
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
                .target(name: "Shared"),
                .target(name: "DomainCompInterface")
            ]
        ),
        Target(
            name: "MockDomainComp",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.mockdomaincomp",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Targets/MockDomainComp/Sources/**"],
            dependencies: [
                .target(name: "Shared"),
                .target(name: "DomainCompInterface")
            ]
        ),
        Target(
            name: "DomainCompInterface",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.domaincomp",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Targets/DomainCompInterface/Sources/**"],
            dependencies: [
                .target(name: "CoreService"),
                .target(name: "Shared"),
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
                .target(name: "Shared"),
                .target(name: "DomainAuthInterface")
            ]
        ),
        Target(
            name: "MockDomainAuth",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.mockdomainauth",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Targets/MockDomainAuth/Sources/**"],
            dependencies: [
                .target(name: "Shared"),
                .target(name: "DomainAuthInterface")
            ]
        ),
        Target(
            name: "DomainAuthInterface",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.domainauthinterface",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Targets/DomainAuthInterface/Sources/**"],
            dependencies: [
                .target(name: "CoreService"),
                .target(name: "Shared"),
            ]
        ),
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
            name: "FeatureCompExample",
            platform: .iOS,
            product: .app,
            bundleId: "com.appcraft.featurecompexample",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .file(path: "Targets/FeatureCompExample/Resources/Info.plist"),
            sources: ["Targets/FeatureCompExample/Sources/**"],
            dependencies: [
                .target(name: "MockDomainComp"),
                .target(name: "DomainCompInterface"),
                .target(name: "FeatureComp")
            ],
            settings: settings
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
                .target(name: "DomainCompInterface"),
                .target(name: "AppCraftCoreUI"),
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
                .target(name: "FeatureAuth"),
                .target(name: "MockDomainAuth"),
                .target(name: "DomainAuthInterface")
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
                .target(name: "DomainAuthInterface"),
                .target(name: "AppCraftCoreUI"),
                .package(product: "ComposableArchitecture"),

            ]
        ),
        Target(
            name: "FeatureBoardExample",
            platform: .iOS,
            product: .app,
            bundleId: "com.appcraft.featureboardexample",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .file(path: "Targets/FeatureBoardExample/Resources/Info.plist"),
            sources: ["Targets/FeatureBoardExample/Sources/**"],
            dependencies: [
                .target(name: "FeatureBoard"),
                .target(name: "DomainBoardInterface"),
                .target(name: "MockDomainBoard"),
            ],
            settings: settings
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
                .target(name: "AppCraftCoreUI"),
                .target(name: "DomainBoardInterface"),
                .package(product: "ComposableArchitecture"),
            ]
        ),
//        Target(
//            name: "CoreDatabase",
//            platform: .iOS,
//            product: .framework,
//            bundleId: "com.appcraft.coredatabase",
//            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
//            infoPlist: .default,
//            sources: ["Targets/CoreDatabase/Sources/**"],
//            dependencies: [
//                .target(name: "Shared"),
//                .package(product: "FirebaseFirestore"),
//            ]
//        ),
//        Target(
//            name: "CoreAuth",
//            platform: .iOS,
//            product: .framework,
//            bundleId: "com.appcraft.coreauth",
//            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
//            infoPlist: .default,
//            sources: ["Targets/CoreAuth/Sources/**"],
//            dependencies: [
//                .target(name: "Shared"),
//                .package(product: "FirebaseAuth"),
//            ]
//        ),
        Target(
            name: "CoreService",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.coreservice",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Targets/CoreService/Sources/**"],
            dependencies: [
                .target(name: "Shared"),
//                .target(name: "CoreAuth"),
//                .target(name: "CoreDatabase"),
//                .package(product: "FirebaseAuth"),
//                .package(product: "FirebaseFirestore"),
//                .package(product: "FirebaseCore"),

            ]
        ),
        Target(
            name: "AppCraftCoreUI",
            platform: .iOS,
            product: .framework,
            bundleId: "com.appcraft.appcraftcoreui",
            deploymentTarget: .iOS(targetVersion: "16.0", devices: [.iphone, .ipad]),
            infoPlist: .default,
            sources: ["Targets/AppCraftCoreUI/Sources/**"],
            resources: ["Targets/AppCraftCoreUI/Resources/**"],
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
