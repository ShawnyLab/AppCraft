//
//  ACText.swift
//
//  Created by Shawn on 11/17/24.
//

import Foundation

public struct ACText: ACCoreType {
    public var id: UUID
    public var content: String
    public var size: Float
    public var color: String?
    
    public init(id: UUID = UUID(), content: String, size: Float = 24.0, color: String? = nil) {
        self.id = id
        self.content = content
        self.size = size
        self.color = color
    }
}
