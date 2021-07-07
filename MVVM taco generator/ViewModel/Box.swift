//
//  Box.swift
//  MVVM taco generator
//
//  Created by Harriette Berndes on 07/07/2021.
//

import Foundation

class Box<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init (value: T) {
        self.value = value
    }
    
    func bind (listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
