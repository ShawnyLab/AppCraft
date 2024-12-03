//
//  CoreServiceType.swift
//  CoreService
//
//  Created by Shawn on 11/29/24.
//

import Foundation
import Shared

public protocol CoreServiceType: Actor {
    // MARK: - Auth Operations
    var currentAccount: ACAccount? { get async throws }
    func signIn(email: String, password: String) async throws -> ACAccount
    func signOut() async throws
    
    // MARK: - Database Operations
    func fetchUserSession(userID: String) async throws -> UserSession
    func createUserData(userID: String, email: String, displayName: String?, method: SignInMethod) async throws
    func deleteUserData(userID: String) async throws
    
    func saveBoard(_ board: Board) async throws
    func fetchBoards() async throws -> [Board]
    func deleteBoard(id: String) async throws
}
