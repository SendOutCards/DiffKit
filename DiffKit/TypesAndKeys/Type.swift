//
//  Type.swift
//  DiffKit
//
//  Created by Bradley Hilton on 10/20/18.
//  Copyright © 2018 SendOutCards. All rights reserved.
//

/// Represents a component's type
enum Type : Hashable {
    /// A concrete type identified by an integer representation
    case type(Int)
    /// An inline type identified by its declaration location
    case inline(file: String, function: String, line: Int, column: Int)
    
    init(of type: Any.Type) {
        self = .type(unsafeBitCast(type, to: Int.self))
    }
    
}

extension NSObjectProtocol {
    
    /**
     The type of component, if any, that this object was created from
     
     - Warning: A component must only reuse objects with the same `type`
    */
    var type: Type? {
        get {
            return storage[\.type]
        }
        set {
            storage[\.type] = newValue
        }
    }
    
}
