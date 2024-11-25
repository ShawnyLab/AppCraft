//
//  ACImage.swift
//
//  Created by Shawn on 11/17/24.
//

import Foundation

public struct ACImage: ACCoreType {
    public var id: UUID
    public var url: String
    
    public init(id: UUID = UUID(), url: String) {
        self.id = id
        self.url = url
    }
}
