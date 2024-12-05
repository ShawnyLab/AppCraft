//
//  FeatureBoard.swift
//  FeatureBoard
//
//  Created by Shawn on 11/26/24.
//

import Foundation
import ComposableArchitecture
import DomainBoardInterface
@preconcurrency import Shared

@Reducer
public struct FeatureBoard {
    private let domainBoard: DomainBoardInterface
    private let userID: String?
    
    public init(domainBoard: DomainBoardInterface, userID: String) {
        self.domainBoard = domainBoard
        self.userID = userID
    }
    
    public struct State: Equatable, Sendable, Identifiable {
        public var id: UUID = UUID()
        public var isLoading: Bool = false
        public var error: String?
        public var boards: [Board] = []  // View를 위한 상태
        
        public init() { }
    }
    
    public enum Action: Equatable {
        case onAppear
        case fetchBoards
        case fetchBoardsResult(TaskResult<[Board]>)
        case deleteBoard(String)
        case deleteBoardResult(TaskResult<String>)
        case clearError
        
        public static func == (lhs: Action, rhs: Action) -> Bool {
            switch (lhs, rhs) {
            case (.onAppear, .onAppear),
                (.fetchBoards, .fetchBoards),
                (.clearError, .clearError):
                return true
            case let (.deleteBoard(lhsId), .deleteBoard(rhsId)):
                return lhsId == rhsId
            case let (.fetchBoardsResult(.success(lhsBoards)), .fetchBoardsResult(.success(rhsBoards))):
                return lhsBoards.map { $0.id } == rhsBoards.map { $0.id }
            case let (.deleteBoardResult(.success(lhsId)), .deleteBoardResult(.success(rhsId))):
                return lhsId == rhsId
            case let (.fetchBoardsResult(.failure(lhsError)), .fetchBoardsResult(.failure(rhsError))),
                 let (.deleteBoardResult(.failure(lhsError)), .deleteBoardResult(.failure(rhsError))):
                return lhsError.localizedDescription == rhsError.localizedDescription
            default:
                return false
            }
        }
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .send(.fetchBoards)
                
            case .fetchBoards:
                state.isLoading = true
                state.error = nil
                
                return .run { send in
                    if let userID {
                        await send(.fetchBoardsResult(
                            TaskResult {
                                let boards = try await domainBoard.fetchBoards(userID: userID)
                                return boards
                            }
                        ))
                    } else {
                        //로그인 화면으로 이동
                    }

                }
                
            case let .fetchBoardsResult(.success(boards)):
                state.isLoading = false
                state.boards = boards
                return .none
                
            case let .fetchBoardsResult(.failure(error)):
                state.isLoading = false
                state.error = error.localizedDescription
                return .none
                
            case .deleteBoard(let id):
                return .run { send in
                    if let userID {
                        await send(.deleteBoardResult(
                            TaskResult {
                                _ = try await domainBoard.deleteBoard(userID: userID, id: id)
                                return id
                            }
                        ))
                    } else {
                        //로그인 화면으로 이동
                    }

                }
                
            case let .deleteBoardResult(.success(id)):
                return .send(.fetchBoards)
                
            case let .deleteBoardResult(.failure(error)):
                state.error = error.localizedDescription
                return .none
                
            case .clearError:
                state.error = nil
                return .none
            }
        }
    }
}

extension FeatureBoard.State {
    public static func == (lhs: FeatureBoard.State, rhs: FeatureBoard.State) -> Bool {
        lhs.id == rhs.id &&
        lhs.isLoading == rhs.isLoading &&
        lhs.error == rhs.error &&
        lhs.boards.map { $0.id } == rhs.boards.map { $0.id }
    }
}
