//
//  MockCoreService.swift
//  CoreService
//
//  Created by Shawn on 11/30/24.
//

import Foundation
import Shared

public actor MockCoreService: CoreServiceType {
    
    var testAccount = ACAccount(userID: "TestID", email: "test@gmail.com")
    public var currentAccount: ACAccount? = ACAccount(userID: "TestID", email: "test@gmail.com")
    
    public func signIn(email: String, password: String) async throws -> ACAccount {
        return testAccount
    }
    
    public func signOut() async throws {
        Task {
            try await Task.sleep(nanoseconds: 1_000_000_000)
        }
        return
    }
    
    public func fetchUserSession(userID: String) async throws -> UserSession {
        return UserSession(id: testAccount.userID,
                           email: testAccount.email ?? "",
                           displayName: "TestName",
                           imageUrl: nil,
                           method: .google)
    }
    
    public func createUserData(userID: String, email: String, displayName: String?, method: SignInMethod) async throws {
        Task {
            try await Task.sleep(nanoseconds: 1_000_000_000)
        }
        return
    }
    
    public func deleteUserData(userID: String) async throws {
        Task {
            try await Task.sleep(nanoseconds: 1_000_000_000)
        }
        return
    }
    
    public func saveComp(_ comp: Comp) async throws {
        return
    }
    
    public func fetchComps() async throws -> [Comp] {
        return []
    }
    
    public func deleteComp(id: String) async throws {
        return
    }
    
    public func saveBoard(_ board: Board) async throws {
        return
    }
    
    public func fetchBoards() async throws -> [Board] {
        return []
    }
    
    public func deleteBoard(id: String) async throws {
        return
    }
}
