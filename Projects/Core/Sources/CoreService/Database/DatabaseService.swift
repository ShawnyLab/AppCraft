//
//  DatabaseService.swift
//  CoreDatabase
//
//  Created by Shawn on 11/27/24.
//

import Foundation
import Shared

public protocol DatabaseService: Actor {
    func fetchUserSession(userID: String) async throws -> UserSession
    func createUserData(userID: String, email: String, displayName: String?, method: SignInMethod) async throws
    func deleteUserData(userID: String) async throws

    // Generic
    func save<T: DatabaseFetchableType>(userID: String, _ item: T) async throws
    func fetchList<T: DatabaseFetchableType>(userID: String, type: T.Type) async throws -> [T]
    func fetch<T: DatabaseFetchableType>(userID: String, type: T.Type, id: String) async throws -> T
    func delete<T: DatabaseFetchableType>(userID: String, type: T.Type, id: String) async throws
}
