//
//  DomainBoardInterface.swift
//  DomainBoard
//
//  Created by Shawn on 12/2/24.
//

import Shared
import Foundation

public protocol DomainBoardInterface {
    var boards: [Board] { get async }
    func saveBoard(_ board: Board) async throws
    func fetchBoards() async throws
    func deleteBoard(id: String) async throws
}
