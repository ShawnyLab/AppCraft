//
//  BoardRepository.swift
//  BoardRepository
//
//  Created by Shawn on 12/3/24.
//

import Foundation
import Shared
import CoreDatabase

public class BoardRepository: BoardRepositoryInterface {
    public var boards: [Board] = []
    private let database: DatabaseService
    
    public init(database: DatabaseService) {
        self.database = database
    }
    
    public func saveBoard(userID: String, _ board: Board) async throws {
        try await database.save(userID: userID, board)
        try await fetchBoards(userID: userID)
    }
    
    public func fetchBoards(userID: String) async throws {
        boards = try await database.fetchList(userID: userID, type: Board.self)
    }
    
    public func deleteBoard(userID: String, id: String) async throws {
        try await database.delete(userID: userID, type: Board.self, id: id)
        try await fetchBoards(userID: userID)
    }
}
