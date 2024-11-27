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
    func createUserData(userID: String, email: String) async throws
    func deleteUserData(userID: String) async throws
    func saveComp(_ comp: any CompType) async throws
    func fetchComps() async throws -> [any CompType]
    func fetchComp(id: UUID) async throws -> any CompType
    func deleteComp(id: UUID) async throws
}
