//
//  File.swift
//
//  Created by Shawn on 11/21/24.
//

import Foundation

public protocol CompType: Identifiable, Equatable, Codable {
    var id: UUID { get }
    var name: String { get }
    var thumbnail: [any ACCoreType] { get }
    var cores: [any ACCoreType] { get }
}
