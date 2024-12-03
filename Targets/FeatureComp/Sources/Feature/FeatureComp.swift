//
//  FeatureComp.swift
//  FeatureComp
//
//  Created by Shawn on 11/26/24.
//

import Foundation
import ComposableArchitecture
import DomainCompInterface
@preconcurrency import Shared

@Reducer
public struct FeatureComp {
    private let domainComp: DomainCompInterface
    
    public init(domainComp: DomainCompInterface) {
        self.domainComp = domainComp
    }
    
    public struct State: Equatable, Sendable, Identifiable {
        public var id: UUID = UUID()
        public var isLoading: Bool = false
        public var error: String?
        public var comps: [any CompType] = []  // View를 위한 상태
        
        public init() { }
    }
    
    public enum Action: Equatable {
        case onAppear
        case fetchComps
        case fetchCompsResult(TaskResult<[any CompType]>)
        case deleteComp(String)
        case deleteCompResult(TaskResult<String>)
        case clearError
        
        public static func == (lhs: Action, rhs: Action) -> Bool {
            switch (lhs, rhs) {
            case (.onAppear, .onAppear),
                (.fetchComps, .fetchComps),
                (.clearError, .clearError):
                return true
            case let (.deleteComp(lhsId), .deleteComp(rhsId)):
                return lhsId == rhsId
            case let (.fetchCompsResult(.success(lhsComps)), .fetchCompsResult(.success(rhsComps))):
                return lhsComps.map { $0.id } == rhsComps.map { $0.id }
            case let (.deleteCompResult(.success(lhsId)), .deleteCompResult(.success(rhsId))):
                return lhsId == rhsId
            case let (.fetchCompsResult(.failure(lhsError)), .fetchCompsResult(.failure(rhsError))),
                 let (.deleteCompResult(.failure(lhsError)), .deleteCompResult(.failure(rhsError))):
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
                return .send(.fetchComps)
                
            case .fetchComps:
                state.isLoading = true
                state.error = nil
                
                return .run { send in
                    await send(.fetchCompsResult(
                        TaskResult {
                            try await domainComp.fetchComps()
                            let comps = await domainComp.comps
                            return comps
                        }
                    ))
                }
                
            case let .fetchCompsResult(.success(comps)):
                state.isLoading = false
                state.comps = comps
                return .none
                
            case let .fetchCompsResult(.failure(error)):
                state.isLoading = false
                state.error = error.localizedDescription
                return .none
                
            case .deleteComp(let id):
                return .run { send in
                    await send(.deleteCompResult(
                        TaskResult {
                            try await domainComp.deleteComp(id: id)
                            return id
                        }
                    ))
                }
                
            case let .deleteCompResult(.success(id)):
                return .send(.fetchComps)
                
            case let .deleteCompResult(.failure(error)):
                state.error = error.localizedDescription
                return .none
                
            case .clearError:
                state.error = nil
                return .none
            }
        }
    }
}

extension FeatureComp.State {
    public static func == (lhs: FeatureComp.State, rhs: FeatureComp.State) -> Bool {
        lhs.id == rhs.id &&
        lhs.isLoading == rhs.isLoading &&
        lhs.error == rhs.error &&
        lhs.comps.map { $0.id } == rhs.comps.map { $0.id }
    }
}
