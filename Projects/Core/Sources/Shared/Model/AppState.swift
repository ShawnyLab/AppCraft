//
//  AppState.swift
//  AppCraft
//
//  Created by Shawn on 11/26/24.
//

import Foundation

public final class AppState: ObservableObject {
    @Published public var currentTab: AppCraftTab = .board
    public var userID: String?
    
    public init() {
    }
}
