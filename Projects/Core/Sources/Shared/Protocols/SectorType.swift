//
//  SectorProtocol.swift
//
//  Created by Shawn on 11/12/24.
//

import Foundation

public protocol SectorType: Identifiable, Equatable, Codable {
    var id: String { get }
    var cores: [any ACCoreType] { get }
}
