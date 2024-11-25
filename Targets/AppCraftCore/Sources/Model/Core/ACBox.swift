//
//  ACBox.swift
//
//  Created by Shawn on 11/17/24.
//

import Foundation
import AppCraftCore

public struct ACBox: ACCoreType {
    public var id: UUID
    public var width: Double?
    public var height: Double?
    public var color: String?
    public var radius: Double?
    
    public init(id: UUID = UUID(), width: Double? = nil, height: Double? = nil, color: String? = nil, radius: Double? = nil) {
        self.id = id
        self.width = width
        self.height = height
        self.color = color
        self.radius = radius
    }
}
