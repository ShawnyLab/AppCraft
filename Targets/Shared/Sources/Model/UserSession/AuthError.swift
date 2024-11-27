//
//  AuthError.swift
//  DomainAuth
//
//  Created by Shawn on 11/27/24.
//

import Foundation

public enum AuthError: Error {
    case notAuthenticated
    case invalidCredentials
    case networkError
    case permissionDenied
    case unknown
}
