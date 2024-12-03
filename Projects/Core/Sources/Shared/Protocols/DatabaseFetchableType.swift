//
//  DatabaseFetchableType.swift
//  Shared
//
//  Created by Shawn on 11/29/24.
//

import Foundation

public protocol DatabaseFetchableType: Codable, Identifiable, Equatable {
    static var path: String { get }
    var id: String { get }
}
