//
//  AppState.swift
//  AppCraft
//
//  Created by Shawn on 11/26/24.
//

import Foundation

public final class AppState: ObservableObject {
    static public let shared = AppState()
    
    @Published public var currentTab: AppCraftTab = .board
    @Published public var showTabBar = true
    
    public var userID: String?
    
    private init() {
    }
}
