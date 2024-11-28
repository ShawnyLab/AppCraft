//
//  CoreAuth.swift
//  CoreAuth
//
//  Created by Shawn on 11/27/24.
//

import FirebaseAuth
import Shared

public actor CoreAuth: AuthService {
    private let auth: Auth
    private let database: CoreDatabase
    
    public init(
        auth: Auth = Auth.auth(),
        database: CoreDatabase = CoreDatabase()
    ) {
        self.auth = auth
        self.database = database
    }
    
    public var currentUser: UserSession? {
        get async throws {
            guard let firebaseUser = auth.currentUser else { return nil }
            return try await database.fetchUserSession(userID: firebaseUser.uid)
        }
    }
    
    public func signIn(email: String, password: String) async throws -> UserSession {
        do {
            let result = try await auth.signIn(withEmail: email, password: password)
            return try await database.fetchUserSession(userID: result.user.uid)
        } catch {
            throw AuthError.invalidCredentials
        }
    }
    
    public func signOut() throws {
        do {
            try auth.signOut()
        } catch {
            throw AuthError.unknown
        }
    }
    
    public func register(email: String, password: String) async throws -> UserSession {
        do {
            let result = try await auth.createUser(withEmail: email, password: password)
            try await database.createUserData(userID: result.user.uid, email: email)
            return try await database.fetchUserSession(userID: result.user.uid)
        } catch {
            throw AuthError.invalidCredentials
        }
    }
    
    public func deleteAccount() async throws {
        guard let user = auth.currentUser else {
            throw AuthError.notAuthenticated
        }
        
        do {
            try await database.deleteUserData(userID: user.uid)
            try await user.delete()
        } catch {
            throw AuthError.unknown
        }
    }
}
