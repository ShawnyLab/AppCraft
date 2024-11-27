//
//  FeatureBoard.swift
//  FeatureBoard
//
//  Created by Shawn on 11/26/24.
//

//import Foundation
//import ComposableArchitecture
//import Shared
//
//@Reducer
//public struct FeatureBoard {
//    public init() { }
//    
//    public struct State: Equatable, Sendable, Identifiable {
//        public var id: UUID
//        public var sectors: [any SectorType] = []
//        
//        public init() {
//            self.id = UUID()
//        }
//    }
//
//    public enum Action: Equatable {
//        case addSector(any SectorType)
//        case deleteSector(UUID)
//        
//        public static func == (lhs: Action, rhs: Action) -> Bool {
//            switch (lhs, rhs) {
//            case let (.addSector(lhsSector), .addSector(rhsSector)):
//                return lhsSector.id == rhsSector.id
//            case let (.deleteSector(lhsId), .deleteSector(rhsId)):
//                return lhsId == rhsId
//            default:
//                return false
//            }
//        }
//    }
//    
//    public var body: some ReducerOf<Self> {
//        Reduce { state, action in
//            switch action {
//            case .addSector(let sector):
//                state.sectors.append(sector)
//                return .none
//                
//            case .deleteSector(let id):
//                state.sectors.removeAll(where: { $0.id == id })
//                return .none
//            }
//        }
//    }
//}
//
//// MARK: - State Extensions
//extension FeatureBoard.State {
//    // Array storage wrapper for protocol type
//    private class SectorArray {
//        var sectors: [any SectorType]
//        
//        init(sectors: [any SectorType]) {
//            self.sectors = sectors
//        }
//    }
//    
//    // Equatable implementation
//    public static func == (lhs: FeatureBoard.State, rhs: FeatureBoard.State) -> Bool {
//        guard lhs.id == rhs.id,
//              lhs.sectors.count == rhs.sectors.count else {
//            return false
//        }
//        
//        // Compare each sector
//        return zip(lhs.sectors, rhs.sectors).allSatisfy { lhsSector, rhsSector in
//            lhsSector.id == rhsSector.id
//        }
//    }
//}
