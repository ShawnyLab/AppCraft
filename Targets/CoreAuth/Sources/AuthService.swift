//
//  AuthService.swift
//  CoreAuth
//
//  Created by Shawn on 11/27/24.
//

import Foundation
import Shared

public protocol AuthService: Actor {
    var currentUser: UserSession? { get async throws }
    func signIn(email: String, password: String) async throws -> UserSession
    func signOut() throws
    func register(email: String, password: String) async throws -> UserSession
    func deleteAccount() async throws
}
