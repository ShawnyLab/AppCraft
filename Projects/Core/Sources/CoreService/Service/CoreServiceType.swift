//
//  CoreServiceType.swift
//  CoreService
//
//  Created by Shawn on 11/29/24.
//

import Foundation
import Shared

public protocol CoreServiceType: Actor {
    // MARK: - Auth Operations
    var currentAccount: ACAccount? { get async throws }
    func signIn(email: String, password: String) async throws -> ACAccount
    func signOut() async throws
}
