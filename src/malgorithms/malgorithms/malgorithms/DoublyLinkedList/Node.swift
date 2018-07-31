//
//  Node.swift
//  malgorithms
//
//  Created by Muhand Jumah on 7/27/18.
//  Copyright © 2018 Muhand Jumah. All rights reserved.
//

import Foundation

public class Node<T> {
    public var value: T
    var next: Node<T>?
    weak var previous: Node<T>?
    
    init(value: T) {
        self.value = value
    }
}
