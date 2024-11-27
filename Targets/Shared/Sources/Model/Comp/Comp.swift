//
//  Comp.swift
//  AppCraft
//
//  Created by Shawn on 11/10/24.
//

import Foundation

public struct Comp: CompType {
    public static func == (lhs: Comp, rhs: Comp) -> Bool {
        lhs.id == rhs.id
    }
    
    public var id: UUID
    public var name: String
    
    public var _thumbnail: [ACCoreTypeWrapper]
    public var thumbnail: [any ACCoreType] {     // 접근용 계산 프로퍼티
        get {
            (_thumbnail.compactMap { try? $0.decode() })
        }
        set {
            _thumbnail = (try? newValue.map { try ACCoreTypeWrapper(core: $0) }) ?? []
        }
    }
    
    private var _cores: [ACCoreTypeWrapper]  // 저장용 프로퍼티
    public var cores: [any ACCoreType] {     // 접근용 계산 프로퍼티
        get {
            (_cores.compactMap { try? $0.decode() })
        }
        set {
            _cores = (try? newValue.map { try ACCoreTypeWrapper(core: $0) }) ?? []
        }
    }
     
    public init(id: UUID = UUID(), name: String, thumbnail: [any ACCoreType] = [], cores: [any ACCoreType] = []) {
        self.id = id
        self.name = name
        self._cores = (try? cores.map { try ACCoreTypeWrapper(core: $0) }) ?? []
        self._thumbnail = (try? thumbnail.map { try ACCoreTypeWrapper(core: $0) }) ?? []
    }
    
    // Codable 구현
    private enum CodingKeys: String, CodingKey {
        case id, name, thumbnail, cores, dictionary
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        _cores = try container.decode([ACCoreTypeWrapper].self, forKey: .cores)
        _thumbnail = try container.decode([ACCoreTypeWrapper].self, forKey: .thumbnail)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(_thumbnail, forKey: .thumbnail)
        try container.encode(_cores, forKey: .cores)
    }
}
