//
//  DomainBoardInterface.swift
//  DomainBoard
//
//  Created by Shawn on 12/2/24.
//

import Shared
import Foundation

public protocol DomainBoardInterface {
    func saveBoard(userID: String, _ board: Board) async throws -> [Board]
    func getBoards() -> [Board]
    func fetchBoards(userID: String) async throws -> [Board]
    func deleteBoard(userID: String, id: String) async throws -> [Board]
}
