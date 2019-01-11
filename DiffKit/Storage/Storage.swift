//
//  Storage.swift
//  DiffKit
//
//  Created by Bradley Hilton on 10/20/18.
//  Copyright © 2018 SendOutCards. All rights reserved.
//

private var storageKey = "storageKey"

extension NSObjectProtocol {
    
    /// A storage property that allows you to save and retrieve typed values safely
    public var storage: TypedStorage<Self> {
        guard let storage = objc_getAssociatedObject(self, &storageKey) as? UntypedStorage else {
            let storage = UntypedStorage()
            objc_setAssociatedObject(self, &storageKey, storage, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return TypedStorage(storage)
        }
        return TypedStorage(storage)
    }
    
}

/// A typed storage interface that uses the `Root`'s key paths as keys
public struct TypedStorage<Root> {
    
    private let untyped: UntypedStorage
    
    fileprivate init(_ untyped: UntypedStorage) {
        self.untyped = untyped
    }
    
    /**
     A subscript for getting and setting a stored `Value`
     - Parameter keyPath: A `KeyPath` from the `Root` to a `Value`
     - Returns: A `Value`, if present
     */
    public subscript<Value>(keyPath: KeyPath<Root, Value>) -> Value? {
        get {
            return untyped.storage[keyPath] as? Value
        }
        nonmutating set {
            untyped.storage[keyPath] = newValue
        }
    }
    
    /**
     A subscript for getting and setting an optional stored `Value`
     - Parameter keyPath: A `KeyPath` from the `Root` to an optional `Value`
     - Returns: An optional `Value`
    */
    public subscript<Value>(keyPath: KeyPath<Root, Value?>) -> Value? {
        get {
            return untyped.storage[keyPath] as? Value
        }
        nonmutating set {
            untyped.storage[keyPath] = newValue
        }
    }
    
    /**
     A `get` only subscript returning a stored `Value`, lazily initialized with a default value if not found
     - Parameters:
        - keyPath: A `KeyPath` from the `Root` to a `Value`
        - defaultValue: A lazily initialized default `Value`
     - Returns: A stored `Value`, lazily initialized with the default value if not found
    */
    public subscript<Value>(keyPath: KeyPath<Root, Value>, default defaultValue: @autoclosure () -> Value) -> Value {
        guard let property = untyped.storage[keyPath] as? Value else {
            let property = defaultValue()
            untyped.storage[keyPath] = property
            return property
        }
        return property
    }
    
}

fileprivate class UntypedStorage {
    fileprivate var storage: [AnyKeyPath: Any] = [:]
}

