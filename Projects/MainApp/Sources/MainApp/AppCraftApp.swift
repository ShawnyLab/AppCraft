import SwiftUI
import UIKit
import Shared
import FeatureMain

@main
struct AppCraftApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            VStack {
                DefaultView()
                    .background(Color.white.ignoresSafeArea())
            }
            .preferredColorScheme(.light)
            .environmentObject(AppState.shared)
        }
    }
}
