//
//  DomainComp.swift
//  DomainComp
//
//  Created by Shawn on 11/26/24.
//

import Foundation
import CoreDatabase
import Shared
import DomainAuthInterface

public final class DomainComp {
    private let database: CoreDatabase
    private let authService: DomainAuthInterface
    
    public init(
        database: CoreDatabase,
        authService: DomainAuthInterface
    ) {
        self.database = database
        self.authService = authService
    }
    
    public func saveComp(_ comp: Comp) async throws {
        // 인증 확인
        try await authService.requireAuthentication()
        
        // 쓰기 권한 확인
        guard try await authService.validatePermissions(for: .writeData) else {
            throw CompError.permissionDenied
        }
        
        try await database.saveComp(comp)
    }
    
    public func fetchComps() async throws -> [any CompType] {
        // 인증 확인
        try await authService.requireAuthentication()
        
        // 읽기 권한 확인
        guard try await authService.validatePermissions(for: .readData) else {
            throw CompError.permissionDenied
        }
        
        return try await database.fetchComps()
    }
    
    public func deleteComp(id: UUID) async throws {
        // 인증 확인
        try await authService.requireAuthentication()
        
        // Comp 조회하여 생성자 확인
        let comp = try await database.fetchComp(id: id)
        let userID = try await authService.getAuthenticatedUserID()
        
        // 삭제 권한 확인 (생성자이거나 관리자)
//        let isCreator = comp.id
//        let isAdmin = try await authService.validatePermissions(for: .adminAction)
//        
//        guard isCreator || isAdmin else {
//            throw CompError.permissionDenied
//        }
        
        try await database.deleteComp(id: id)
    }
}
