//
//  AppCraftTab.swift
//  AppCraft
//
//  Created by Shawn on 12/5/24.
//

import Foundation

public enum AppCraftTab: String, Identifiable, CaseIterable {
    public var id: String {
        self.rawValue
    }
    
    case board, comps, apps, social
}
