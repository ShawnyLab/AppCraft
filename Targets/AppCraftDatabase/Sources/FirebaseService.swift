//
//  FirebaseService.swift
//  AppCraftDatabase
//
//  Created by Shawn on 11/17/24.
//

import Foundation
import AppCraftCore
import FirebaseFirestore

public class FirebaseService: DatabaseServiceType {
    private let db = Firestore.firestore()
    
    public init() {}
    
    public func fetchSectors() async throws -> [any SectorType] {
        try await withCheckedThrowingContinuation { continuation in
            db.collection("sectors")
                .getDocuments { snapshot, error in
                    if let error = error {
                        continuation.resume(throwing: error)
                        return
                    }
                    
                    let sectors = [any SectorType]()
                    
//                    let sectors = snapshot?.documents.compactMap { document -> SectorType? in
//                        try? document.data(as: SectorType.self)
//                    } ?? []
                    
                    continuation.resume(returning: sectors)
                }
        }
    }
}
