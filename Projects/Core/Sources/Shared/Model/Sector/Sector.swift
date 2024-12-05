//
//  File.swift
//
//  Created by Shawn on 11/21/24.
//

import Foundation

public struct Sector: SectorType {
    public var cores: [any ACCoreType] {
        get {
            return (_cores.compactMap { try? $0.decode() })
        }
        set {
            _cores = (try? newValue.map { try ACCoreTypeWrapper(core: $0) }) ?? []
        }
    }
    
    private var _cores: [ACCoreTypeWrapper]
    public var id: String
    
    public init(id: UUID = UUID(), cores: [any ACCoreType]) {
        self.id = id.uuidString
        self._cores = (try? cores.map { try ACCoreTypeWrapper(core: $0) }) ?? []
    }
    
    public static func == (lhs: Sector, rhs: Sector) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Sector: Codable {
    private enum CodingKeys: String, CodingKey {
        case id, cores
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        _cores = try container.decode([ACCoreTypeWrapper].self, forKey: .cores)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(_cores, forKey: .cores)
    }
}
