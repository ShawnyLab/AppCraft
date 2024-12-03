//
//  ACCoreType.swift
//
//  Created by Shawn on 11/17/24.
//

import Foundation

public protocol ACCoreType: Identifiable, Equatable, Codable {
    var id: UUID { get }
}
