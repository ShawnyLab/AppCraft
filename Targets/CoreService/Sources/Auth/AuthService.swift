//
//  AuthService.swift
//  CoreAuth
//
//  Created by Shawn on 11/27/24.
//

import Foundation
import Shared

public protocol AuthService: Actor {
    var currentAccount: ACAccount? { get async throws }
    func signIn(email: String, password: String) async throws -> ACAccount
    func signOut() throws
}
