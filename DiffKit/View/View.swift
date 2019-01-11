//
//  View.swift
//  DiffKit
//
//  Created by Bradley Hilton on 10/20/18.
//  Copyright © 2018 SendOutCards. All rights reserved.
//

/// A reusable view component
public struct View {
    
    let type: Type
    private let instance: () -> UIView
    private let configure: (UIView) -> ()
    private let update: (UIView) -> ()
    
    /**
     Defines a reusable view component
     - Parameters:
        - class: A `UIView` class.
        - instance: A new `UIView` instance.
        - configure: A method to configure a new view. Only called once.
        - update: A method to update an already configured view. Supports animation.
    */
    public init<View : UIView>(
        file: String = #file,
        function: String = #function,
        line: Int = #line,
        column: Int = #column,
        class: View.Type = View.self,
        instance: @escaping @autoclosure () -> View = View(),
        configure: @escaping (View) -> () = { _ in },
        update: @escaping (View) -> () = { _ in }
    ) {
        type = .inline(
            file: file,
            function: function,
            line: line,
            column: column
        )
        self.instance = instance
        self.configure = { configure($0 as! View) }
        self.update = { update($0 as! View) }
    }
    
    /// - Parameter key: A hashable key
    /// - Returns: A new instance without animation
    func newInstance(with key: AnyHashable) -> UIView {
        var newInstance: UIView?
        UIView.performWithoutAnimation {
            let instance = self.instance()
            instance.type = self.type
            instance.key = key
            configure(instance)
            update(instance)
            newInstance = instance
        }
        return newInstance!
    }
    
}
