//
//  MockDomainBoard.swift
//  Shared
//
//  Created by Shawn on 12/2/24.
//

import Foundation
import Shared
import DomainBoardInterface

public actor MockDomainBoard: DomainBoardInterface {
    public var boards: [Board]
    
    public init(boards: [Board] = []) {
        self.boards = [
            Board.mock,
            Board(id: "newId", name: "My Board1", createrId: "testID", rootBoardId: "newId", createdAt: .now),
            Board(id: "newId2", name: "My Board2", createrId: "testID", rootBoardId: "newId", createdAt: .now),
            Board(id: "newId3", name: "My Board3", createrId: "testID", rootBoardId: "newId", createdAt: .now),
            Board(id: "newId4", name: "My Board4", createrId: "testID", rootBoardId: "newId", createdAt: .now),
            Board.addButton
        ]
    }
    
    public func saveBoard(_ board: Board) async throws {
        return
    }
    
    public func fetchBoards() async throws {
        return
    }
    
    public func deleteBoard(id: String) async throws {
        return
    }
}
