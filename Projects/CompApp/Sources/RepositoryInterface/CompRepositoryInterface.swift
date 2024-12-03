//
//  CompRepositoryInterface.swift
//  CompRepositoryInterface
//
//  Created by Shawn on 12/3/24.
//

import Foundation

public protocol CompRepositoryInterface {
    func saveComp(_ comp: Comp) async throws
    func fetchComps() async throws -> [Comp]
    func deleteComp(id: String) async throws
}
