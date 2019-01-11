//
//  ResolvedConstraint.swift
//  DiffKit
//
//  Created by Bradley Hilton on 10/20/18.
//  Copyright © 2018 SendOutCards. All rights reserved.
//

/// A concrete, value-type, representation of a NSLayoutConstraint
struct ResolvedConstraint {
    let firstItem: AnyObject
    let firstAttribute: NSLayoutConstraint.Attribute
    let relation: NSLayoutConstraint.Relation
    let secondItem: AnyObject?
    let secondAttribute: NSLayoutConstraint.Attribute
    let multiplier: CGFloat
    let constant: CGFloat
    let priority: UILayoutPriority
    
    init(constraint: Constraint, firstItem: AnyObject, secondItem: AnyObject?) {
        self.firstItem = firstItem
        self.firstAttribute = constraint.attribute
        self.relation = constraint.relation
        self.secondItem = secondItem ?? (constraint.targetAttribute != .notAnAttribute ? firstItem : nil)
        self.secondAttribute = constraint.targetAttribute
        self.multiplier = constraint.multiplier
        self.constant = constraint.constant
        self.priority = constraint.priority
    }
    
}
