//
//  CoreDatabase.swift
//  AppCraft
//
//  Created by Shawn on 11/26/24.
//

import Foundation
import FirebaseFirestore
import Shared

public actor CoreDatabase: DatabaseService {
    private let firestore: Firestore
    
    public init(firestore: Firestore = Firestore.firestore()) {
        self.firestore = firestore
    }
    
    public func fetchUserSession(userID: String) async throws -> UserSession {
        let userDoc = try await firestore.collection("users").document(userID).getDocument()
        
        guard let userData = userDoc.data() else {
            throw AuthError.invalidCredentials
        }
        
        let permissions = (userData["permissions"] as? [String])?.compactMap { Permission(rawValue: $0) }
        
        return UserSession(
            id: userID,
            email: userData["email"] as? String ?? "",
            displayName: userData["displayName"] as? String,
            permissions: Set(permissions ?? [])
        )
    }
    
    public func createUserData(userID: String, email: String) async throws {
        let defaultPermissions: Set<Permission> = [.read]
        
        try await firestore.collection("users").document(userID).setData([
            "email": email,
            "permissions": defaultPermissions.map { $0.rawValue }
        ])
    }
    
    public func deleteUserData(userID: String) async throws {
        try await firestore.collection("users").document(userID).delete()
    }
    
    public func saveComp(_ comp: any CompType) async throws {
        try await firestore.collection("competitions").document(comp.id.uuidString).setData([
            //TODO: Set data
            "id": comp.id.uuidString
        ])
    }
    
    public func fetchComps() async throws -> [any CompType] {
        let snapshot = try await firestore.collection("competitions").getDocuments()
        
//        return try snapshot.documents.compactMap { document in
//            guard
//                let data = document.data(),
//                let idString = data["id"] as? String
//            else {
//                return [any CompType]()
//            }
//            
//            return [Comp(
//                id: idString
//            )]
//        }
        
        return []
    }
    
    public func fetchComp(id: UUID) async throws -> any CompType {
        let snapshot = try await firestore.collection("competitions")
            .document(id.uuidString)
            .getDocument()
//        
//        guard
//            let data = snapshot.data()
//        else {
//            throw DatabaseError.notFound
//        }
//        
        return Comp(
            id: UUID(),
            name: ""
        )
    }
    
    public func deleteComp(id: UUID) async throws {
        try await firestore.collection("competitions").document(id.uuidString).delete()
    }
}
