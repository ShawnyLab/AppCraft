//
//  BoardRepositoryInterface.swift
//  BoardRepositoryInterface
//
//  Created by Shawn on 12/3/24.
//

import Foundation
import Shared

public protocol BoardRepositoryInterface {
    var boards: [Board] { get }
    
    func saveBoard(userID: String, _ board: Board) async throws
    func fetchBoards(userID: String) async throws
    func deleteBoard(userID: String, id: String) async throws
}
