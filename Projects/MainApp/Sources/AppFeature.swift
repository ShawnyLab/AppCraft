//
//  AppFeature.swift
//  AppCraft
//
//  Created by Shawn on 11/25/24.
//

//import Foundation
//import ComposableArchitecture
//
//public struct AppFeature: Reducer {
//    public struct State {
//        public var auth: AuthFeature.State
//        public var comp: CompFeature.State
//        
//        public init() {
//            self.auth = AuthFeature.State()
//            self.comp = CompFeature.State()
//        }
//    }
//    
//    public enum Action {
//        case auth(AuthFeature.Action)
//        case comp(CompFeature.Action)
//    }
//    
//    public var body: some ReducerOf<Self> {
//        Scope(state: \.auth, action: /Action.auth) {
//            AuthFeature()
//        }
//        Scope(state: \.comp, action: /Action.comp) {
//            CompFeature()
//        }
//        Reduce { state, action in
//            switch action {
//            case .auth(.authResponse(.success(false))):
//                // When user logs out, clear sensitive data
//                state.comp = CompFeature.State()
//                return .none
//                
//            default:
//                return .none
//            }
//        }
//    }
//}
