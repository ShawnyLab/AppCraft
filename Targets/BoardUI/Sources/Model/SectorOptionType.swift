//
//  SectorOptionType.swift
//  AppCraftUI
//
//  Created by Shawn on 11/18/24.
//

import Foundation

enum SectorOptionType: String, Identifiable, CaseIterable {
    case simpleText, image, horizontal, grid, divider, textWithDivider, emptySpace
    
    var id: String {
        self.rawValue
    }
    
    var name: String {
        switch self {
        case .simpleText:
            return "Title"
        case .image:
            return "Image"
        case .horizontal:
            return "Horizontal"
        case .grid:
            return "Grid"
        case .divider:
            return "Divider"
        case .textWithDivider:
            return "Text + Divider"
        case .emptySpace:
            return "Space"
        }
    }
    
    var nameKor: String {
        switch self {
        case .simpleText:
            return "텍스트"
        case .image:
            return "이미지"
        case .horizontal:
            return "가로 정렬"
        case .grid:
            return "그리드"
        case .divider:
            return "구분선"
        case .textWithDivider:
            return "텍스트와 구분선"
        case .emptySpace:
            return "빈 공간"
        }
    }
}
