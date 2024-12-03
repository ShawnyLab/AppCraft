//
//  DomainBoard.swift
//  AppCraft
//
//  Created by Shawn on 12/2/24.
//

import Foundation
import Shared
import DomainBoardInterface
//
//actor DomainBoard: DomainBoardInterface {
//    private let service: CoreServiceType
//    private var _boards: [Board] = []
//    
//    public var boards: [Board] {
//        _boards
//    }
//    
//    public init(service: CoreServiceType) {
//        self.service = service
//    }
//    
//    public func saveBoard(_ board: Board) async throws {
//        try await service.saveBoard(board)
//        try await fetchBoards()  // 저장 후 목록 갱신
//    }
//    
//    public func fetchBoards() async throws {
//        _boards = try await service.fetchBoards()
//    }
//    
//    public func deleteBoard(id: String) async throws {
//        try await service.deleteBoard(id: id)
//        try await fetchBoards()  // 삭제 후 목록 갱신
//    }
//}
