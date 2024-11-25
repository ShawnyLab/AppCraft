//
//  CompFeature.swift
//  CompKit
//
//  Created by Shawn on 11/22/24.
//

import Foundation
import ComposableArchitecture
@preconcurrency import AppCraftCore

@Reducer
public struct CompFeature {
    public init() { }
    
    public struct State: Equatable, Sendable, Identifiable {
        public var id: UUID
        public var comps: [any CompType] = []
        
        public init() {
            self.id = UUID()
        }
    }

    public enum Action: Equatable {
        case addComp(any CompType)
        case deleteComp(UUID)
        
        public static func == (lhs: Action, rhs: Action) -> Bool {
            switch (lhs, rhs) {
            case let (.addComp(lhsComp), .addComp(rhsComp)):
                return lhsComp.id == rhsComp.id
            case let (.deleteComp(lhsId), .deleteComp(rhsId)):
                return lhsId == rhsId
            default:
                return false
            }
        }
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .addComp(let comp):
                state.comps.append(comp)
                return .none
                
            case .deleteComp(let id):
                state.comps.removeAll(where: { $0.id == id })
                return .none
            }
        }
    }
}

// MARK: - State Extensions
extension CompFeature.State {
    // Array storage wrapper for protocol type
    private class CompArray {
        var comps: [any CompType]
        
        init(comps: [any CompType]) {
            self.comps = comps
        }
    }
    
    // Equatable implementation
    public static func == (lhs: CompFeature.State, rhs: CompFeature.State) -> Bool {
        guard lhs.id == rhs.id,
              lhs.comps.count == rhs.comps.count else {
            return false
        }
        
        // Compare each sector
        return zip(lhs.comps, rhs.comps).allSatisfy { lhsComp, rhsComp in
            lhsComp.id == rhsComp.id
        }
    }
}
