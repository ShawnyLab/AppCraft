//
//  FeatureCreateBoard.swift
//  FeatureBoard
//
//  Created by Shawn on 12/5/24.
//

import Foundation
import ComposableArchitecture
import Shared

@Reducer
public struct FeatureCreateBoard {
    public init() {
        
    }
    
    public struct State: Equatable, Sendable, Identifiable {
        public var id: UUID = UUID()
        public var sectors: [Sector] = []

        public init() { }
    }
    
    public enum Action: Equatable {
        case addSector(any SectorType)
        case deleteSector(String)
        case save
        
        public static func == (lhs: Action, rhs: Action) -> Bool {
            switch (lhs, rhs) {
            case (.addSector(let lhs), .addSector(let rhs)):
                return lhs.id == rhs.id
            default:
                return false
            }
        }
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .addSector(let sector):
                state.sectors.append(sector as! Sector)
                return .none
                
            case .deleteSector(let id):
                state.sectors.removeAll { $0.id == id }
                return .none
                
            case .save:
                return .none
            }
        }
    }
}
