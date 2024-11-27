//
//  MockDatabaseService.swift
//  CoreDatabase
//
//  Created by Shawn on 11/27/24.
//

import Foundation
import Shared

public actor MockDatabaseService: DatabaseService {
    public var users: [String: UserSession] = ["testId": UserSession(id: "testId",
                                                              email: "Test@gmail.com",
                                                              displayName: "Shawn",
                                                              permissions: [.read])]
    public var competitions: [UUID: any CompType] = [:]
    
    public init() { }
    
    public func fetchUserSession(userID: String) async throws -> UserSession {
        guard let user = users[userID] else {
            throw DatabaseError.notFound
        }
        return user
    }
    
    public func createUserData(userID: String, email: String) async throws {
        users[userID] = UserSession(id: userID, email: email, displayName: nil, permissions: [.read])
    }
    
    public func deleteUserData(userID: String) async throws {
        users.removeValue(forKey: userID)
    }
    
    public func saveComp(_ comp: any CompType) async throws {
        competitions[comp.id] = comp
    }
    
    public func fetchComps() async throws -> [any CompType] {
        Array(competitions.values)
    }
    
    public func fetchComp(id: UUID) async throws -> any CompType {
        guard let comp = competitions[id] else {
            throw DatabaseError.notFound
        }
        return comp
    }
    
    public func deleteComp(id: UUID) async throws {
        competitions.removeValue(forKey: id)
    }
}

enum DatabaseError: Error {
    case notFound
}
