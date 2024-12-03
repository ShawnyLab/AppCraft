//
//  DomainComp.swift
//  DomainComp
//
//  Created by Shawn on 11/26/24.
//

import Foundation
import DomainCompInterface
import Shared

public actor DomainComp: DomainCompInterface {
    private let service: CoreServiceType
    private var _comps: [any CompType] = []
    
    public var comps: [any CompType] {
        _comps
    }
    
    public init(service: CoreServiceType) {
        self.service = service
    }
    
    public func saveComp(_ comp: Comp) async throws {
        try await service.saveComp(comp)
        try await fetchComps()  // 저장 후 목록 갱신
    }
    
    public func fetchComps() async throws {
        _comps = try await service.fetchComps()
    }
    
    public func deleteComp(id: String) async throws {
        try await service.deleteComp(id: id)
        try await fetchComps()  // 삭제 후 목록 갱신
    }
}
