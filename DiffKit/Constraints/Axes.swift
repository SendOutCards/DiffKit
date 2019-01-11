//
//  Axes.swift
//  DiffKit
//
//  Created by Bradley Hilton on 10/20/18.
//  Copyright © 2018 SendOutCards. All rights reserved.
//

/// Represents a layout axis (either the x-axis or y-axis)
public protocol Axis {
    var layoutAttribute: NSLayoutConstraint.Attribute { get }
}

/// Represents the horizontal layout axis
public enum XAxis : Axis {
    case left
    case right
    case leading
    case trailing
    case centerX
    
    public var layoutAttribute: NSLayoutConstraint.Attribute {
        switch self {
        case .left: return .left
        case .right: return .right
        case .leading: return .leading
        case .trailing: return .trailing
        case .centerX: return .centerX
        }
    }
    
}

/// Represents the vertical layout axis
public enum YAxis : Axis {
    case top
    case bottom
    case centerY
    case lastBaseline
    case firstBaseline
    
    public var layoutAttribute: NSLayoutConstraint.Attribute {
        switch self {
        case .top: return .top
        case .bottom: return .bottom
        case .centerY: return .centerY
        case .lastBaseline: return .lastBaseline
        case .firstBaseline: return .firstBaseline
        }
    }
    
}
