//
//  DomainAuthInterface.swift
//  DomainAuthInterface
//
//  Created by Shawn on 11/27/24.
//

import Foundation
import Shared
import CoreService

public protocol DomainAuthInterface {
    var currentUser: UserSession? { get }
    func signIn(email: String, password: String) async throws -> ACAccount
    func signOut() async throws
}
