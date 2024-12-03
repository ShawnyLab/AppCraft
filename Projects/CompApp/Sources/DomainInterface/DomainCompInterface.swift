//
//  DomainCompType.swift
//  DomainComp
//
//  Created by Shawn on 11/29/24.
//

import Foundation
import Shared

public protocol DomainCompInterface: Actor {
    var comps: [any CompType] { get async }
    func saveComp(_ comp: Comp) async throws
    func fetchComps() async throws
    func deleteComp(id: String) async throws
}
