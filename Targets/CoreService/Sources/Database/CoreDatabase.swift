//
//  CoreDatabase.swift
//  AppCraft
//
//  Created by Shawn on 11/26/24.
//

//import Foundation
//import FirebaseFirestore
//import Shared
//
//public actor CoreDatabase: DatabaseService {
//    private let firestore: Firestore
//    
//    public init() {
//        firestore = Firestore.firestore()
//    }
//    
//    public func fetchUserSession(userID: String) async throws -> UserSession {
//        return try await fetch(userID: userID, type: UserSession.self, id: userID)
//    }
//    
//    public func createUserData(userID: String, email: String, displayName: String?, method: SignInMethod) async throws {
//        return try await firestore
//            .collection("users")
//            .document(userID)
//            .setData([
//                "id": userID,
//                "email": email,
//                "displayName": displayName,
//                "method": method.rawValue
//            ])
//    }
//    
//    public func deleteUserData(userID: String) async throws {
//        return try await firestore
//            .collection("users")
//            .document(userID)
//            .delete()
//    }
//    
//    public func save<T>(userID: String, _ item: T) async throws where T : DatabaseFetchableType {
//        let data = try JSONEncoder().encode(item)
//        let dict = try JSONSerialization.jsonObject(with: data) as? [String: Any] ?? [:]
//        
//        return try await firestore
//            .collection(T.path)
//            .document(item.id)
//            .setData(dict)
//    }
//    
//    public func fetchList<T>(userID: String, type: T.Type) async throws -> [T] where T : DatabaseFetchableType {
//        let snapshot = try await firestore
//            .collection(T.path)  // Note: This assumes T has an empty init
//            .getDocuments()
//        
//        return try snapshot.documents.compactMap { document in
//            let data = document.data()
//            let jsonData = try JSONSerialization.data(withJSONObject: data)
//            return try JSONDecoder().decode(T.self, from: jsonData)
//        }
//    }
//    
//    public func fetch<T>(userID: String, type: T.Type, id: String) async throws -> T where T : DatabaseFetchableType {
//        let snapshot = try await firestore
//            .collection(T.path)
//            .document(id)
//            .getDocument()
//            
//        guard
//            let data = snapshot.data(),
//            let jsonData = try? JSONSerialization.data(withJSONObject: data),
//            let item = try? JSONDecoder().decode(T.self, from: jsonData)
//        else {
//            throw DatabaseError.notFound
//        }
//        
//        return item
//    }
//    
//    public func delete<T>(userID: String, type: T.Type, id: String) async throws where T : DatabaseFetchableType {
//        try await firestore
//            .collection(T.path)
//            .document(id)
//            .delete()
//    }
//}
