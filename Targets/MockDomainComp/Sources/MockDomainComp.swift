//
//  MockDomainComp.swift
//  DomainComp
//
//  Created by Shawn on 11/29/24.
//

import Foundation
import Shared
import DomainCompInterface

public actor MockDomainComp: DomainCompInterface {
    private var _comps: [any CompType] = [Comp.mock]
    
    public init() { }
    
    public var comps: [any CompType] {
        _comps
    }
    
    public func saveComp(_ comp: Comp) async throws {
        _comps.append(comp)
    }
    
    public func fetchComps() async throws {
        // Mock data or do nothing
        print("fetch comps")
    }
    
    public func deleteComp(id: String) async throws {
        _comps.removeAll(where: { $0.id == id })
    }
}
