import ProjectDescription

let project = Project(
    name: "MainApp",
    targets: [
        .target(
            name: "AppCraft",
            destinations: .iOS,
            product: .app,
            bundleId: "com.indecode.appcraft",
            infoPlist: .file(path: "Sources/Info.plist"),
            sources: ["Sources/MainApp/**"],
            resources: [
                "Sources/Resources/**",
                "Sources/Resources/GoogleService-Info.plist",
            ],
            dependencies: [
                .project(target: "FeatureMain", path: "../TotalApp"),
                .project(target: "Shared", path: "../Core"),

            ],
            settings: .settings(
                base: [
                    "DEVELOPMENT_TEAM": "JRXGXW25BG"
                ]
            )
        )
    ]
)
