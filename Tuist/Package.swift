// swift-tools-version: 5.9
import PackageDescription

#if TUIST
    import ProjectDescription
    import ProjectDescriptionHelpers

    let packageSettings = PackageSettings(
        productTypes: [
            "FirebaseAnalytics": .staticFramework,
            "FirebaseAuth": .staticFramework,
            "FirebaseFirestore": .staticFramework,
            "FirebaseCore": .staticFramework,
            "ComposableArchitecture": .staticFramework
            
        ]
    )
#endif

let package = Package(
    name: "Dependencies",
    dependencies: [
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "10.0.0"),
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", .upToNextMajor(from: "1.8.0"))
    ]
)
