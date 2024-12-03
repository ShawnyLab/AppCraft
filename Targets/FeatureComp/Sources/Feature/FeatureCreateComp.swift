//
//  FeatureCreateComp.swift
//  FeatureComp
//
//  Created by Shawn on 11/26/24.
//

import Foundation
import ComposableArchitecture
import Shared
import DomainCompInterface

@Reducer
public struct FeatureCreateComp {
    private let domainComp: DomainCompInterface
    
    public init(domainComp: DomainCompInterface) {
        self.domainComp = domainComp
    }
    
    public struct State: Equatable {
        public var cores: [any ACCoreType]
        public var showCoreOptions: Bool
        public var coreAddingPosition: CoreAddingPosition?
        public var selectedRowId: UUID?
        public var isSaveable: Bool
        public var isSaving: Bool
        public var componentName: String
        public var error: String?
        
        public init() {
            self.cores = [ACColumn(cores: [])]
            self.showCoreOptions = false
            self.coreAddingPosition = nil
            self.selectedRowId = nil
            self.isSaveable = false
            self.isSaving = false
            self.componentName = ""
            self.error = nil
        }
    }
    
    public enum Action: Equatable {
        case addCore(any ACCoreType, position: CoreAddingPosition)
        case toggleCoreOptions(Bool)
        case updateCorePosition(CoreAddingPosition?)
        case updateSelectedRow(UUID?)
        case updateComponentName(String)
        case save
        case saveResponse(TaskResult<Comp>)
        case cancel
        case clearError
        case delegate(Delegate)
        
        public enum Delegate: Equatable {
            case didSaveComp(Comp)
            case didCancel
            case didFailWithAuth
        }
        
        public static func == (lhs: Action, rhs: Action) -> Bool {
            switch (lhs, rhs) {
            case let (.addCore(lhsCore, lhsPos), .addCore(rhsCore, rhsPos)):
                return lhsCore.id == rhsCore.id && lhsPos == rhsPos
            case let (.toggleCoreOptions(lhs), .toggleCoreOptions(rhs)):
                return lhs == rhs
            case let (.updateCorePosition(lhs), .updateCorePosition(rhs)):
                return lhs == rhs
            case let (.updateSelectedRow(lhs), .updateSelectedRow(rhs)):
                return lhs == rhs
            case let (.updateComponentName(lhs), .updateComponentName(rhs)):
                return lhs == rhs
            case (.save, .save),
                 (.cancel, .cancel),
                 (.clearError, .clearError):
                return true
            case let (.saveResponse(lhs), .saveResponse(rhs)):
                return lhs == rhs
            case let (.delegate(lhs), .delegate(rhs)):
                return lhs == rhs
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
                case .left, .right:
                    guard let selectedRowId = state.selectedRowId,
                          let rowIndex = column.cores.firstIndex(where: { $0.id == selectedRowId }),
                          var row = column.cores[rowIndex] as? ACRow else { return .none }
                    
                    if position == .left {
                        row.cores.insert(core, at: 0)
                    } else {
                        row.cores.append(core)
                    }
                    
                    column.cores[rowIndex] = row
                    
                case .down:
                    column.cores.append(ACRow(cores: [core]))
                }
                
                state.isSaveable = true
                state.cores[0] = column
                state.showCoreOptions = false
                state.coreAddingPosition = nil
                state.selectedRowId = nil
                
                return .none
                
            case let .toggleCoreOptions(isShown):
                state.showCoreOptions = isShown
                if !isShown {
                    state.coreAddingPosition = nil
                    state.selectedRowId = nil
                }
                return .none
                
            case let .updateCorePosition(position):
                state.coreAddingPosition = position
                return .none
                
            case let .updateSelectedRow(id):
                state.selectedRowId = id
                return .none
                
            case let .updateComponentName(name):
                state.componentName = name
                return .none
                
            case .save:
                guard !state.cores.isEmpty else { return .none }
                
                state.isSaving = true
                state.error = nil
                
                let comp = Comp(
                    id: UUID().uuidString,
                    name: state.componentName.isEmpty ? "New Component" : state.componentName,
                    thumbnail: state.cores
                )
                
                return .run { [comp] send in
                    do {
                        try await domainComp.saveComp(comp)
                        await send(.saveResponse(.success(comp)))
                    } catch {
                        await send(.saveResponse(.failure(error)))
                    }
                }
            case let .saveResponse(.success(comp)):
                state.isSaving = false
                return .run { send in
                    await send(.delegate(.didSaveComp(comp)))
                }
                
            case let .saveResponse(.failure(error)):
                state.isSaving = false
                state.error = error.localizedDescription
                return .none
                
            case .cancel:
                return .run { send in
                    await send(.delegate(.didCancel))
                }
                
            case .clearError:
                state.error = nil
                return .none
                
            case .delegate:
                return .none
            }
        }
    }
}

extension FeatureCreateComp.State {
    private class CoreArray {
        var cores: [any ACCoreType]
        
        init(cores: [any ACCoreType]) {
            self.cores = cores
        }
    }
    
    public static func == (lhs: FeatureCreateComp.State, rhs: FeatureCreateComp.State) -> Bool {
        guard lhs.cores.count == rhs.cores.count,
              lhs.showCoreOptions == rhs.showCoreOptions,
              lhs.coreAddingPosition == rhs.coreAddingPosition,
              lhs.selectedRowId == rhs.selectedRowId,
              lhs.isSaving == rhs.isSaving,
              lhs.componentName == rhs.componentName,
              lhs.error == rhs.error else {
            return false
        }
        
        return zip(lhs.cores, rhs.cores).allSatisfy { lhsCore, rhsCore in
            lhsCore.id == rhsCore.id
        }
    }
}
