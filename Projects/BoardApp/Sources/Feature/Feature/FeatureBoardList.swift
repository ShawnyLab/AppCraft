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
    
    @ObservableState
    public struct State {
        public var id: UUID = UUID()
        public var isLoading: Bool = false
        public var error: String?
        public var boards: [Board] = []  // View를 위한 상태
        
        public var path = StackState<Path.State>()
        
        public init() { }
    }

    public enum Action {
        case onAppear
        case fetchBoards
        case fetchBoardsResult(TaskResult<[Board]>)
        case deleteBoard(String)
        case deleteBoardResult(TaskResult<String>)
        case clearError
        case createNewBoardTapped
        
        case path(StackActionOf<Path>)
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                return .send(.fetchBoards)
                
            case .createNewBoardTapped:
                state.path.append(.createBoard(FeatureCreateBoard.State()))
                return .none

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
            case .path(_):
                return .none
            }
        }
        .forEach(\.path, action: \.path)
    }
    
    @Reducer
    public enum Path {
        case createBoard(FeatureCreateBoard)
//        case editBoard(FeatureEditBoard)
    }
}
