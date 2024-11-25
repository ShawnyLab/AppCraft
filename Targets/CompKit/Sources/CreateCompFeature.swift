//
//  CreateCompFeature.swift
//  CompKit
//
//  Created by Shawn on 11/25/24.
//

import Foundation
import ComposableArchitecture
import AppCraftCore

@Reducer
public struct CreateCompFeature {
    public init() { }
    
    public struct State: Equatable { 
        public var cores: [any ACCoreType]
        public var showCoreOptions: Bool
        public var coreAddingPosition: CoreAddingPosition?
        
        public init() {
            self.cores = [ACColumn(cores: [])]
            self.showCoreOptions = false
            self.coreAddingPosition = nil
        }

    }
    
    public enum Action: Equatable {
        case addCore(any ACCoreType, position: CoreAddingPosition)
        case toggleCoreOptions(Bool)
        case updateCorePosition(CoreAddingPosition?)
        case save
        case cancel
        
        public static func == (lhs: Action, rhs: Action) -> Bool {
            switch (lhs, rhs) {
            case let (.addCore(lhsCore, lhsPos), .addCore(rhsCore, rhsPos)):
                return lhsCore.id == rhsCore.id && lhsPos == rhsPos
            case let (.toggleCoreOptions(lhs), .toggleCoreOptions(rhs)):
                return lhs == rhs
            case let (.updateCorePosition(lhs), .updateCorePosition(rhs)):
                return lhs == rhs
            case (.save, .save), (.cancel, .cancel):
                return true
            default:
                return false
            }
        }
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .addCore(core, position):
                guard var column = state.cores[0] as? ACColumn else { return .none }
                
                switch position {
                case .left:
                    guard let rowIndex = UserDefaults.standard.value(forKey: "CurrentRowIndex") as? Int,
                          var row = column.cores[rowIndex] as? ACRow else { return .none }
                    row.cores.insert(core, at: 0)
                    column.cores[rowIndex] = row
                    state.cores[0] = column
                    
                case .right:
                    guard let rowIndex = UserDefaults.standard.value(forKey: "CurrentRowIndex") as? Int,
                          var row = column.cores[rowIndex] as? ACRow else { return .none }
                    row.cores.append(core)
                    column.cores[rowIndex] = row
                    state.cores[0] = column
                    
                case .down:
                    column.cores.append(ACRow(cores: [core]))
                    state.cores[0] = column
                }
                
                return .run { send in
                    await send(.toggleCoreOptions(false))
                    await send(.updateCorePosition(nil))
                    UserDefaults.standard.removeObject(forKey: "CurrentRowIndex")
                }
                
            case let .toggleCoreOptions(isShow):
                state.showCoreOptions = isShow
                return .none
                
            case let .updateCorePosition(position):
                state.coreAddingPosition = position
                return .none
                
            case .save, .cancel:
                return .none
            }
        }
    }
}

// MARK: - State Extensions
extension CreateCompFeature.State {
    // Array storage wrapper for protocol type
    private class CompArray {
        var comps: [any CompType]
        
        init(comps: [any CompType]) {
            self.comps = comps
        }
    }
    
    // Equatable implementation
    public static func == (lhs: CreateCompFeature.State, rhs: CreateCompFeature.State) -> Bool {
        guard lhs.cores.count == rhs.cores.count
                && lhs.showCoreOptions == rhs.showCoreOptions
                && lhs.coreAddingPosition == rhs.coreAddingPosition else {
            return false
        }
        
        // Compare each sector
        return zip(lhs.cores, rhs.cores).allSatisfy { lhsComp, rhsComp in
            lhsComp.id == rhsComp.id
        }
    }
}
