//
//  DomainBoard.swift
//  AppCraft
//
//  Created by Shawn on 12/2/24.
//

import Foundation
import Shared
import DomainBoardInterface
import BoardRepository

public actor DomainBoard: @preconcurrency DomainBoardInterface {
    private let repository: BoardRepositoryInterface
    
    public init (repository: BoardRepositoryInterface) {
        self.repository = repository
    }
    
    public func fetchBoards(userID: String) async throws -> [Board] {
        try await repository.fetchBoards(userID: userID)
        return repository.boards
    }
    
    public func getBoards() -> [Board] {
        return repository.boards
    }
    
    public func saveBoard(userID: String, _ board: Board) async throws -> [Board] {
        try await repository.saveBoard(userID: userID, board)
        return repository.boards
    }

    public func deleteBoard(userID: String, id: String) async throws -> [Board] {
        try await repository.deleteBoard(userID: userID, id: id)
        return repository.boards
    }
}
