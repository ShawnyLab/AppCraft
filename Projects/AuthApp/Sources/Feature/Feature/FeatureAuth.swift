//
//  FeatureAuth.swift
//  FeatureAuth
//
//  Created by Shawn on 11/27/24.
//

import Foundation
import ComposableArchitecture
import DomainAuthInterface
@preconcurrency import Shared

@Reducer
public struct FeatureAuth {
    private let auth: DomainAuthInterface
    
    public init(auth: DomainAuthInterface) {
        self.auth = auth
    }
    
    public struct State: Equatable, Sendable, Identifiable {
        public static func == (lhs: FeatureAuth.State, rhs: FeatureAuth.State) -> Bool {
            lhs.id == rhs.id
        }
        
        public var id: UUID
        public var email: String
        public var password: String
        public var isAuthenticated: Bool
        public var currentUser: ACAccount?
        public var isLoading: Bool
        public var error: AuthError?
        
        public init(
            id: UUID = UUID(),
            email: String = "",
            password: String = "",
            isAuthenticated: Bool = false,
            currentUser: ACAccount? = nil,
            isLoading: Bool = false,
            error: AuthError? = nil
        ) {
            self.id = id
            self.email = email
            self.password = password
            self.isAuthenticated = isAuthenticated
            self.currentUser = currentUser
            self.isLoading = isLoading
            self.error = error
        }
    }

    public enum Action: Equatable {
        case signIn
        case signInResponse(TaskResult<ACAccount>)
        case signOut
        case signOutResponse(TaskResult<Void>)
        case clearError
        
        public static func == (lhs: Action, rhs: Action) -> Bool {
            switch (lhs, rhs) {
            case (.signIn, .signIn),
                 (.signOut, .signOut),
                 (.clearError, .clearError):
                return true
            case let (.signInResponse(lResult), .signInResponse(rResult)):
                return compareTaskResults(lResult, rResult)
            case let (.signOutResponse(lResult), .signOutResponse(rResult)):
                return true
            default:
                return false
            }
        }
        
        private static func compareTaskResults<T: Equatable>(_ lhs: TaskResult<T>, _ rhs: TaskResult<T>) -> Bool {
            switch (lhs, rhs) {
            case let (.success(lValue), .success(rValue)):
                return lValue == rValue
            case let (.failure(lError), .failure(rError)):
                return lError.localizedDescription == rError.localizedDescription
            default:
                return false
            }
        }
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .signIn:
                state.isLoading = true
                state.error = nil
                return .run { [email = state.email, password = state.password] send in
                    do {
                        let user = try await auth.signIn(email: email, password: password)
                        await send(.signInResponse(.success(user)))
                    } catch {
                        await send(.signInResponse(.failure(error)))
                    }
                }
                
            case let .signInResponse(.success(user)):
                state.isLoading = false
                state.currentUser = user
                state.isAuthenticated = true
                return .none
                
            case let .signInResponse(.failure(error)):
                state.isLoading = false
                state.error = error as? AuthError ?? .unknown
                return .none
                
            case .signOut:
                state.isLoading = true
                state.error = nil
                return .run { send in
                    do {
                        try await auth.signOut()
                        await send(.signOutResponse(.success(())))
                    } catch {
                        await send(.signOutResponse(.failure(error)))
                    }
                }
                
            case .signOutResponse(.success):
                state.isLoading = false
                state.currentUser = nil
                state.isAuthenticated = false
                return .none
                
            case let .signOutResponse(.failure(error)):
                state.isLoading = false
                state.error = error as? AuthError ?? .unknown
                return .none

            case .clearError:
                state.error = nil
                return .none
            }
        }
    }
}
