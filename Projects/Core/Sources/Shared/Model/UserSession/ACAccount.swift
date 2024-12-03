//
//  ACAccount.swift
//  Shared
//
//  Created by Shawn on 11/29/24.
//

import Foundation

public struct ACAccount: Equatable {
    public let userID: String
    public let email: String?
    
    public init(userID: String, email: String?) {
        self.userID = userID
        self.email = email
    }
}
