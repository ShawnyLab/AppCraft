//
//  DatabaseServiceType.swift
//  AppCraftCore
//
//  Created by Shawn on 11/17/24.
//

import Foundation

public protocol DatabaseServiceType {
    func fetchSectors() async throws -> [any SectorType]
}
