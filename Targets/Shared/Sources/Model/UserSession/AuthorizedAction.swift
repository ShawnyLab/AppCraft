//
//  AuthorizedAction.swift
//  DomainAuth
//
//  Created by Shawn on 11/27/24.
//

import Foundation

public enum AuthorizedAction {
    case readData
    case writeData
    case adminAction
    
    public var requiredPermissions: Set<Permission> {
        switch self {
        case .readData: return [.read]
        case .writeData: return [.write]
        case .adminAction: return [.admin]
        }
    }
}
