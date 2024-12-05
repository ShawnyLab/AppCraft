import SwiftUI
import UIKit

@main
struct AppCraftApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            VStack {
                DefaultView()
                    .background(Color.white.ignoresSafeArea())
            }
            .environmentObject(AppState())
            .preferredColorScheme(.light)
        }
    }
}
