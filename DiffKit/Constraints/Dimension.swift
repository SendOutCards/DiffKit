//
//  Dimension.swift
//  DiffKit
//
//  Created by Bradley Hilton on 10/20/18.
//  Copyright © 2018 SendOutCards. All rights reserved.
//

/// Represents a layout dimension (either width or height)
public enum Dimension {
    case width
    case height
    
    public var layoutAttribute: NSLayoutConstraint.Attribute {
        switch self {
        case .width: return .width
        case .height: return .height
        }
    }
    
}
