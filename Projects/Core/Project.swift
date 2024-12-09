import ProjectDescription

let project = Project(
    name: "Core",
    packages: [
        .remote(
            url: "https://github.com/firebase/firebase-ios-sdk",
            requirement: .branch("main")
        )
    ],
    targets: [
        .target(
            name: "CoreAuth",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.appcraft.coreauth",
            infoPlist: .default,
            sources: ["Sources/CoreAuth/**"],
            dependencies: [
                .target(name: "Shared"),
                .external(name: "FirebaseAuth")
//                .package(product: "FirebaseAuth")
            ]
        ),
        .target(
            name: "CoreDatabase",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.appcraft.coredatabase",
            infoPlist: .default,
            sources: ["Sources/CoreDatabase/**"],
            dependencies: [
                .target(name: "Shared"),
                .external(name: "FirebaseFirestore")
//                .package(product: "FirebaseFirestore")
            ]
        ),
        .target(
            name: "AppCraftCoreUI",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.appcraft.appcraftcoreui",
            infoPlist: .default,
            sources: ["Sources/AppCraftCoreUI/**"],
            resources: ["Sources/AppCraftCoreUI/Resources/**"],
            dependencies: [
                .target(name: "Shared"),
            ]
        ),
        .target(
            name: "Shared",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.appcraft.shared",
            infoPlist: .default,
            sources: ["Sources/Shared/**"]
        )
    ]
)
