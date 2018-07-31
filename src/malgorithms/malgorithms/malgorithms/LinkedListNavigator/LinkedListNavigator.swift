//
//  LinkedListNavigator.swift
//  malgorithms
//
//  Created by Muhand Jumah on 7/29/18.
//  Copyright © 2018 Muhand Jumah. All rights reserved.
//

import Foundation

public class LinkedListNavigator<T> {
    public var delegate: NavigatorDelegate?
    public var currentNode: Node<T>?
    fileprivate var linkedList: DoublyLinkedList<T>
    
    public init(linkedList: DoublyLinkedList<T>, startAtIndex: Int = 0) {
        self.linkedList = linkedList
        
        // Start current node to point at head
        if startAtIndex == 0 {
            currentNode = linkedList.head
        } else {
            currentNode = linkedList.nodeAt(index: startAtIndex)
        }
    }
    
    // Move right
    public func moveRight() {
        // On move right
        // Move the current node to point to the next node
        currentNode = currentNode?.next
        delegate?.movedRight()
        delegate?.selectionChanged(newValue: currentNode?.value)
    }
    
    // Move left
    public func moveLeft() {
        currentNode = currentNode?.previous
        delegate?.movedLeft()
        delegate?.selectionChanged(newValue: currentNode?.value)
    }
    
    
    
}
