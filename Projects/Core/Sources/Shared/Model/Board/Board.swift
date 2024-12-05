//
//  Board.swift
//  Shared
//
//  Created by Shawn on 12/2/24.
//

import Foundation

public struct Board: DatabaseFetchableType {
    public static var path: String = "boards"
    
    public var id: String
    public var name: String
    public var createrId: String
    public var isEditable: Bool
    public var rootBoardId: String
    public var createdAt: Date
    
    public var sectors: [Sector]
    
    public init(id: String,
                name: String,
                createrId: String,
                isEditable: Bool = false,
                rootBoardId: String,
                createdAt: Date,
                sectors: [Sector] = []) {
        self.id = id
        self.name = name
        self.createrId = createrId
        self.isEditable = isEditable
        self.rootBoardId = rootBoardId
        self.createdAt = createdAt
        self.sectors = sectors
    }
}

extension Board {
    public static var mock: Board {
        Board(id: "TestBoard",
              name: "My Test Board",
              createrId: "TestID",
              rootBoardId: "TestBoard",
              createdAt: .now)
    }
    
    public static var addButton: Board {
        Board(id: "+",
              name: "",
              createrId: "",
              rootBoardId: "",
              createdAt: .now)
    }
}
