//
//  UserSession.swift
//  Shared
//
//  Created by Shawn on 11/27/24.
//

import Foundation

public struct UserSession: Equatable {
    public let id: String
    public let email: String
    public let displayName: String?
    public let permissions: Set<Permission>
    
    public init(id: String, email: String, displayName: String?, permissions: Set<Permission>) {
        self.id = id
        self.email = email
        self.displayName = displayName
        self.permissions = permissions
    }
}
