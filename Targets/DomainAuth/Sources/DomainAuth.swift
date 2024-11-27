//
//  DomainAuth.swift
//  DomainAuth
//
//  Created by Shawn on 11/27/24.
//

import Foundation
import CoreAuth
import Shared

public class DomainAuth {
    let auth: AuthService
    
    public init(auth: AuthService) {
        self.auth = auth
    }
    
    public var currentUser: UserSession? {
        get async throws {
            try await auth.currentUser
        }
    }
    
    public var isAuthenticated: Bool {
        get async {
            return (try? await currentUser) != nil
        }
    }
    
    public func signIn(email: String, password: String) async throws -> UserSession {
        try await auth.signIn(email: email, password: password)
    }
    
    public func signOut() async throws {
        try await auth.signOut()
    }
    
    public func validatePermissions(for action: AuthorizedAction) async throws -> Bool {
        guard let user = try await currentUser else { return false }
        return action.requiredPermissions.isSubset(of: user.permissions)
    }
    
    public func getAuthenticatedUserID() async throws -> String {
        guard let user = try await currentUser else {
            throw AuthError.notAuthenticated
        }
        return user.id
    }
    
    public func requireAuthentication() async throws {
        guard try await isAuthenticated else {
            throw AuthError.notAuthenticated
        }
    }
}
