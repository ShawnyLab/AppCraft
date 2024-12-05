//
//  UserRepositoryInterface.swift
//  FeatureAuth
//
//  Created by Shawn on 12/3/24.
//

import Foundation
import Shared

public protocol UserRepositoryInterface {
    func fetchUserSession(userID: String) async throws -> UserSession
    func createUserData(userID: String, email: String, displayName: String?, method: SignInMethod) async throws
    func deleteUserData(userID: String) async throws
}
