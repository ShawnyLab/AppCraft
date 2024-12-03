//
//  ACGrid.swift
//
//  Created by Shawn on 11/17/24.
//

import Foundation

public struct ACGrid: ACCoreType {
    public static func == (lhs: ACGrid, rhs: ACGrid) -> Bool {
        lhs.id == rhs.id
    }
    
    public var id: UUID
    private var _cores: [ACCoreTypeWrapper]  // 저장용 프로퍼티
    public var cores: [any ACCoreType] {     // 접근용 계산 프로퍼티
        get {
            (_cores.compactMap { try? $0.decode() })
        }
        set {
            _cores = (try? newValue.map { try ACCoreTypeWrapper(core: $0) }) ?? []
        }
    }
    public var space: Float?
    
    public init(id: UUID = UUID(), cores: [any ACCoreType], space: Float? = nil) {
        self.id = id
        self._cores = (try? cores.map { try ACCoreTypeWrapper(core: $0) }) ?? []
        self.space = space
    }
    
    // Codable 구현
    private enum CodingKeys: String, CodingKey {
        case id, cores, space
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        _cores = try container.decode([ACCoreTypeWrapper].self, forKey: .cores)
        space = try container.decodeIfPresent(Float.self, forKey: .space)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(_cores, forKey: .cores)
        try container.encode(space, forKey: .space)
    }
}
