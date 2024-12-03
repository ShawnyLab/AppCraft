//
//  CoreOptionType.swift
//  CraftCoreUI
//
//  Created by Shawn on 11/23/24.
//

import SwiftUI

enum CoreOptionType: String, Identifiable, CaseIterable {
    public var id: String {
        self.rawValue
    }
    
    case text, image, space
    
    var image: Image {
        switch self {
        case .text:
            return AppCraftCoreUIAsset.icTextBlack.swiftUIImage
        case .image:
            return AppCraftCoreUIAsset.icImageBlack.swiftUIImage
        case .space:
            return AppCraftCoreUIAsset.icSpaceBlack.swiftUIImage
        }
    }
    
    var name: String {
        switch self {
        case .text:
            return "Text"
        case .image:
            return "Image"
        case .space:
            return "Space"
        }
    }
}
