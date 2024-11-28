//
//  MockAuthService.swift
//  CoreAuth
//
//  Created by Shawn on 11/27/24.
//

import Foundation
import Shared

public actor MockCoreAuthService: AuthService {
    var mockCurrentUser: UserSession?
    private let database: DatabaseService
    private var isSignedIn = false
    
    public init(database: DatabaseService = MockDatabaseService()) {
        self.database = database
    }

    public var currentUser: UserSession? {
        get async throws {
            guard isSignedIn else { return nil }
            return mockCurrentUser
        }
    }
    
    public func signIn(email: String, password: String) async throws -> UserSession {
        guard password.count >= 6 else {
            throw AuthError.invalidCredentials
        }
        
        let userSession = try await database.fetchUserSession(userID: UUID().uuidString)
        mockCurrentUser = userSession
        isSignedIn = true
        return userSession
    }
    
    public func signOut() throws {
        isSignedIn = false
        mockCurrentUser = nil
    }
    
    public func register(email: String, password: String) async throws -> UserSession {
        guard password.count >= 6 else {
            throw AuthError.invalidCredentials
        }
        
        let userID = UUID().uuidString
        try await database.createUserData(userID: userID, email: email)
        let userSession = try await database.fetchUserSession(userID: userID)
        mockCurrentUser = userSession
        isSignedIn = true
        return userSession
    }
    
    public func deleteAccount() async throws {
        guard let user = mockCurrentUser else {
            throw AuthError.notAuthenticated
        }
        
        try await database.deleteUserData(userID: user.id)
        mockCurrentUser = nil
        isSignedIn = false
    }
}
