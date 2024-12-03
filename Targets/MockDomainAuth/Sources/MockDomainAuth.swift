//
//  TestDomainAuth.swift
//  AppCraft
//
//  Created by Shawn on 11/29/24.
//

import Foundation
import Shared
import DomainAuthInterface

public class MockDomainAuth: DomainAuthInterface {
    public init() { }
    
    public var currentUser: UserSession? {
        return UserSession(id: "TestID",
                           email: "test@gmail.com",
                           displayName: "Test User",
                           imageUrl: nil,
                           method: .apple)
    }
    
    public func signIn(email: String, password: String) async throws -> ACAccount {
        return ACAccount(userID: "TestID", email: nil)
    }
    
    public func signOut() async throws {
        return
    }
}
