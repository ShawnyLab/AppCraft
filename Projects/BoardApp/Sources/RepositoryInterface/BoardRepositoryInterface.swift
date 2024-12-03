//
//  BoardRepositoryInterface.swift
//  BoardRepositoryInterface
//
//  Created by Shawn on 12/3/24.
//

import Foundation

public protocol BoardRepositoryInterface {
    func saveComp(_ comp: Comp) async throws
    func fetchComps() async throws -> [Comp]
    func deleteComp(id: String) async throws
}
