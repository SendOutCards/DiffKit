//
//  NSLayoutConstraint.swift
//  DiffKit
//
//  Created by Bradley Hilton on 10/20/18.
//  Copyright © 2018 SendOutCards. All rights reserved.
//

extension NSLayoutConstraint {
    
    /// - Parameter constraint: A `ResolvedConstraint`
    /// - Returns: A `NSLayoutConstraint` from a `ResolvedConstraint`
    convenience init(_ constraint: ResolvedConstraint) {
        self.init(
            item: constraint.firstItem,
            attribute: constraint.firstAttribute,
            relatedBy: constraint.relation,
            toItem: constraint.secondItem,
            attribute: constraint.secondAttribute,
            multiplier: constraint.multiplier,
            constant: constraint.constant
        )
        type = Type(of: ResolvedConstraint.self)
        priority = constraint.priority
    }
    
    /// - Parameter constraint: A `ResolvedConstraint` to compare to this constraint
    /// - Returns: `true` if the `ResolvedConstraint` matches this constraint's parameters
    func matches(_ constraint: ResolvedConstraint) -> Bool {
        return firstItem === constraint.firstItem
            && firstAttribute == constraint.firstAttribute
            && relation == constraint.relation
            && secondItem === constraint.secondItem
            && secondAttribute == constraint.secondAttribute
            && Float(multiplier) == Float(constraint.multiplier)
            && Float(constant) == Float(constraint.constant)
            && priority == constraint.priority
    }
    
}
