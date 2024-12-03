//
//  ACFont.swift
//  AppCraftUI
//
//  Created by Shawn on 11/11/24.
//

import SwiftUI

public enum ACFont {
    public static func custom(_ size: CGFloat, weight: Font.Weight = .regular) -> Font {
        let fontName: String = {
            switch weight {
            case .thin: return "AppleSDGothicNeo-Thin"
            case .light: return "AppleSDGothicNeo-Light"
            case .regular: return "AppleSDGothicNeo-Regular"
            case .medium: return "AppleSDGothicNeo-Medium"
            case .semibold: return "AppleSDGothicNeo-SemiBold"
            case .bold: return "AppleSDGothicNeo-Bold"
            default: return "AppleSDGothicNeo-Regular"
            }
        }()
        
        return .custom(fontName, size: size)
    }
}
