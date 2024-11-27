//
//  DomainAuthInterface.swift
//  DomainAuthInterface
//
//  Created by Shawn on 11/27/24.
//

import Foundation
import Shared

public protocol DomainAuthInterface {
    
    var currentUser: UserSession? { get async throws }
    var isAuthenticated: Bool { get async }
    
    func signIn(email: String, password: String) async throws -> UserSession
    func signOut() async throws
    func validatePermissions(for action: AuthorizedAction) async throws -> Bool
    func getAuthenticatedUserID() async throws -> String
    func requireAuthentication() async throws
}
