//
//  NetworkServiceType.swift
//
//  Created by Shawn on 11/17/24.
//

import Foundation

public protocol NetworkServiceType {
    func fetch<T: Decodable>(endpoint: String) async throws -> T
}
