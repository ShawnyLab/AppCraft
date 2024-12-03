//
//  UserSession.swift
//  Shared
//
//  Created by Shawn on 11/27/24.
//

import Foundation

public struct UserSession: DatabaseFetchableType {
    public static let path = "users"
    
    public let id: String
    public let email: String
    public let displayName: String?
    public let imageUrl: String?
    public let method: SignInMethod
    
    public init(id: String, email: String, displayName: String?, imageUrl: String?, method: SignInMethod) {
        self.id = id
        self.email = email
        self.displayName = displayName
        self.imageUrl = imageUrl
        self.method = method
    }
}
