//
//  Dynamic.swift
//  mvvm
//
//  Created by Куаныш Спандияр on 02.01.2024.
//

import Foundation


class Dynamic<T> {
    typealias Listener = (T) -> Void
    private var listener: Listener?
    
    func bind(_ listener: Listener?) {
        self.listener = listener
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ v: T){
        value = v
    }
    
}
