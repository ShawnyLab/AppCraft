//
//  CoreAddingPosition.swift
//  CompUI
//
//  Created by Shawn on 11/24/24.
//

import Foundation

public enum CoreAddingPosition: String, Identifiable, Equatable {
    public var id: String {
        return self.rawValue
    }
    
    case left, right, down
}
