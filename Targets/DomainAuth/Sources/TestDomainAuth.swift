//
//  TestDomainAuth.swift
//  DomainAuth
//
//  Created by Shawn on 11/27/24.
//

import Foundation
import Shared
import CoreAuth

// MARK: - Test Implementations for DomainAuth
public final class TestDomainAuth: DomainAuth {
    private var mockUser: UserSession?
    private var mockPermissions: Set<Permission> = [.read]
    
    override public init(auth: AuthService = MockAuthService()) {
        super.init(auth: auth)
    }
    
    public override var currentUser: UserSession? {
        get async throws {
            return mockUser
        }
    }
    
    public func setMockUser(_ user: UserSession?) {
        self.mockUser = user
    }
    
    public func setMockPermissions(_ permissions: Set<Permission>) {
        self.mockPermissions = permissions
    }
    
    public override func signIn(email: String, password: String) async throws -> UserSession {
        // 테스트용 사용자 생성
        let user = UserSession(
            id: UUID().uuidString,
            email: email,
            displayName: "Test User",
            permissions: mockPermissions
        )
        mockUser = user
        return user
    }
    
    public override func signOut() async throws {
        mockUser = nil
    }
}

// MARK: - Mock User Session Factory
extension TestDomainAuth {
    public static func createMockUserSession(
        id: String = "testId",
        email: String = "test@example.com",
        displayName: String? = "Test User",
        permissions: Set<Permission> = [.read]
    ) -> UserSession {
        UserSession(
            id: id,
            email: email,
            displayName: displayName,
            permissions: permissions
        )
    }
}
