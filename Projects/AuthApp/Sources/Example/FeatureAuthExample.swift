//
//  FeatureAuthExample.swift
//  FeatureAuthExample
//
//  Created by Shawn on 11/27/24.
//

import SwiftUI

@main
struct FeatureAuthExample: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ExampleView()
                .background(Color.white)
        }
    }
}
