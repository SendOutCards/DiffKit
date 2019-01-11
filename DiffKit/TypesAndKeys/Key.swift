//
//  Key.swift
//  DiffKit
//
//  Created by Bradley Hilton on 10/20/18.
//  Copyright © 2018 SendOutCards. All rights reserved.
//

extension NSObjectProtocol {
    
    /**
     The key, if any, that has been associated with this object
     
     - Warning: A component should only reuse objects with matching keys or that have been recycled
    */
    var key: AnyHashable? {
        get {
            return storage[\.key]
        }
        set {
            storage[\.key] = newValue
        }
    }
    
}
