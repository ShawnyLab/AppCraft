//
//  ACCoreTypeWrapper.swift
//  AppCraftCore
//
//  Created by Shawn on 11/17/24.
//

import Foundation
import AppCraftCore

public struct ACCoreTypeWrapper: Codable {
    let type: ACCoreTypeIdentifier
    let data: Data
    
    public init(core: any ACCoreType) throws {
        
        switch core {
        case is ACHorizontal:
            self.type = .horizontal
        case is ACBox:
            self.type = .box
        case is ACText:
            self.type = .text
        case is ACRow:
            self.type = .row
        case is ACGrid:
            self.type = .grid
        case is ACImage:
            self.type = .image
        case is ACColumn:
            self.type = .column
            
        default:
            throw EncodingError.invalidValue(core, .init(codingPath: [], debugDescription: "Unsupported core type"))
        }
        
        // 코어 객체를 Data로 인코딩
        self.data = try JSONEncoder().encode(core)
    }
    
    public func decode() throws -> any ACCoreType {
        switch type {
        case .horizontal:
            return try JSONDecoder().decode(ACHorizontal.self, from: data)
        case .text:
            return try JSONDecoder().decode(ACText.self, from: data)
        case .image:
            return try JSONDecoder().decode(ACImage.self, from: data)
        case .box:
            return try JSONDecoder().decode(ACBox.self, from: data)
        case .grid:
            return try JSONDecoder().decode(ACGrid.self, from: data)
        case .row:
            return try JSONDecoder().decode(ACRow.self, from: data)
        case .column:
            return try JSONDecoder().decode(ACColumn.self, from: data)
        }
    }
}
