//
//  Target.swift
//  DiffKit
//
//  Created by Bradley Hilton on 10/20/18.
//  Copyright © 2018 SendOutCards. All rights reserved.
//

/// A constraint target representing a view or layout guide
public enum Target : Equatable {
    case superview
    case superviewSafeArea
    case superviewMargins
    case superviewReadableContent
    case keyboard
    case sibling(key: AnyHashable)
}

/// A constraint target representing a superview
public let superview = Target.superview

/// A constraint target representing a superview
public let parent = superview

/// A constraint target representing a superview's safe area layout guide
public let safeArea = Target.superviewSafeArea

/// A constraint target representing a superview's margins layout guide
public let margins = Target.superviewMargins

/// A constraint target representing a superview's readable content layout guid
public let readableContent = Target.superviewReadableContent

/**
 - Parameter key: A hashable key matching that of a sibling view
 - Returns: A constraint target representing a view's sibling
*/
public func sibling(key: AnyHashable) -> Target {
    return .sibling(key: key)
}

extension Target {
    
    /// Represents a target's left layout anchor
    public var left: TargetAndAttribute<XAxis> {
        return (self, .left)
    }
    
    /// Represents a target's right layout anchor
    public var right: TargetAndAttribute<XAxis> {
        return (self, .right)
    }
    
    /// Represents a target's top layout anchor
    public var top: TargetAndAttribute<YAxis> {
        return (self, .top)
    }
    
    /// Represents a target's bottom layout anchor
    public var bottom: TargetAndAttribute<YAxis> {
        return (self, .bottom)
    }
    
    /// Represents a target's leading layout anchor
    public var leading: TargetAndAttribute<XAxis> {
        return (self, .leading)
    }
    
    /// Represents a target's trailing layout anchor
    public var trailing: TargetAndAttribute<XAxis> {
        return (self, .trailing)
    }
    
    /// Represents a target's width layout anchor
    public var width: TargetAndAttribute<Dimension> {
        return (self, .width)
    }
    
    /// Represents a target's height layout anchor
    public var height: TargetAndAttribute<Dimension> {
        return (self, .height)
    }
    
    /// Represents a target's horizontal-center layout anchor
    public var centerX: TargetAndAttribute<XAxis> {
        return (self, .centerX)
    }
    
    /// Represents a target's vertical-center layout anchor
    public var centerY: TargetAndAttribute<YAxis> {
        return (self, .centerY)
    }
    
    /// Represents a target's last baseline layout anchor
    public var lastBaseline: TargetAndAttribute<YAxis> {
        return (self, .lastBaseline)
    }
    
    /// Represents a target's first baseline layout anchor
    public var firstBaseline: TargetAndAttribute<YAxis> {
        return (self, .firstBaseline)
    }
    
}

extension Target {
    
    func item(superview: UIView, window: UIWindow, siblings: [AnyHashable: AnyObject]) -> AnyObject {
        switch self {
        case .superview: return superview
        case .superviewSafeArea:
            return superview.safeAreaLayoutGuide
        case .superviewMargins: return superview.layoutMarginsGuide
        case .superviewReadableContent: return superview.readableContentGuide
        case .keyboard:
            //            return window.keyboardLayoutGuide
            return TODO()
        case .sibling(let key):
            guard let sibling = siblings[key] else {
                fatalError("Unable to find sibling view or layout guide for key: \(key)")
            }
            return sibling
        }
    }
    
}
