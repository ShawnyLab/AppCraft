//
//  CoreService.swift
//  CoreService
//
//  Created by Shawn on 11/29/24.
//

//import Foundation
//import CoreAuth
//import CoreDatabase
//import Shared
//
//public actor CoreService: CoreServiceType {
//    public static let example = MockCoreService()
//    
//    private let auth: AuthService
//    private let database: DatabaseService
//    
//    private init(
//        auth: AuthService,
//        database: DatabaseService
//    ) {
//        self.auth = auth
//        self.database = database
//    }
//    
//    // MARK: - Auth Operations
//    public var currentAccount: ACAccount? {
//        get async throws {
//            try await auth.currentAccount
//        }
//    }
//    
//    public func signIn(email: String, password: String) async throws -> ACAccount {
//        try await auth.signIn(email: email, password: password)
//    }
//    
//    public func signOut() async throws {
//        try await Task { @MainActor in
//            try await auth.signOut()
//        }.value
//    }
//    
//    // MARK: - Database Operations
//    public func fetchUserSession(userID: String) async throws -> UserSession {
//        guard let _ = try await auth.currentAccount else {
//            throw AuthError.notAuthenticated
//        }
//        
//        return try await database.fetchUserSession(userID: userID)
//    }
//    
//    public func createUserData(userID: String, email: String, displayName: String?, method: SignInMethod) async throws {
//        guard let _ = try await auth.currentAccount else {
//            throw AuthError.notAuthenticated
//        }
//        
//        try await database.createUserData(userID: userID, email: email, displayName: displayName, method: method)
//    }
//    
//    public func deleteUserData(userID: String) async throws {
//        guard let _ = try await auth.currentAccount else {
//            throw AuthError.notAuthenticated
//        }
//        
//        try await database.deleteUserData(userID: userID)
//    }
//    
//    public func saveComp(_ comp: Comp) async throws {
//        guard let account = try await auth.currentAccount else {
//            throw AuthError.notAuthenticated
//        }
//        
//        try await database.save(userID: account.userID, comp)
//    }
//    
//    public func fetchComps() async throws -> [Comp] {
//        guard let account = try await auth.currentAccount else {
//            throw AuthError.notAuthenticated
//        }
//        
//        return try await database.fetchList(userID: account.userID, type: Comp.self)
//    }
//    
//    public func deleteComp(id: String) async throws {
//        guard let account = try await auth.currentAccount else {
//            throw AuthError.notAuthenticated
//        }
//        
//        try await database.delete(userID: account.userID, type: Comp.self, id: id)
//    }
//}
