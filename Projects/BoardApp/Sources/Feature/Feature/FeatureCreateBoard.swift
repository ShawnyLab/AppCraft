//
//  FeatureCreateBoard.swift
//  FeatureBoard
//
//  Created by Shawn on 12/5/24.
//

import Foundation
import ComposableArchitecture
@preconcurrency import Shared

@Reducer
public struct FeatureCreateBoard {
    public init() {
        
    }
    
    @ObservableState
    public struct State: Equatable, Sendable, Identifiable, Hashable {
        public var id: UUID = UUID()
        public var sectors: [Sector] = []
        public var isEditingTitle: Bool = false
        public var title: String = "My Board"
        
        public func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
        
        public static func == (lhs: Self, rhs: Self) -> Bool {
            lhs.id == rhs.id &&
            lhs.sectors == rhs.sectors
        }

        public init() { }
    }
    
    @Dependency(\.dismiss) var dismiss
    public enum Action: Equatable {
        case addSector(any SectorType)
        case deleteSector(String)
        case save
        case cancel
        case toggleTitleEditing
        case updateTitle(String)
        
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
                
            case .cancel:
                return .run { _ in
                    await self.dismiss()
                }
                
            case .toggleTitleEditing:
                state.isEditingTitle.toggle()
                return .none
                
            case .updateTitle(let newTitle):
                state.title = newTitle
                return .none
            }
        }
    }
}
