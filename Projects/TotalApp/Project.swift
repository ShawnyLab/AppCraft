import ProjectDescription

let project = Project(
    name: "TotalApp",
    targets: [
        .target(
            name: "FeatureMain",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.indecode.featuremain",
            infoPlist: .default,
            sources: ["Sources/FeatureMain/**"],
            dependencies: [
                .project(target: "AppCraftCoreUI", path: "../Core"),
                .project(target: "Shared", path: "../Core"),
                .project(target: "FeatureBoard", path: "../BoardApp"),
                .project(target: "DomainBoard", path: "../BoardApp"),
                .project(target: "DomainBoardInterface", path: "../BoardApp"),
                .project(target: "BoardRepository", path: "../BoardApp"),
                
                .project(target: "CoreDatabase", path: "../Core"),
                .external(name: "ComposableArchitecture"),
            ]
        )
    ]
)
