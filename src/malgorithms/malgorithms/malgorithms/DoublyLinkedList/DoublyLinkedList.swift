//
//  Linkedlist.swift
//  malgorithms

//
//  Created by Muhand Jumah on 7/27/18.
//  Copyright © 2018 Muhand Jumah. All rights reserved.
//
/**
 GetLength
 bool Find
 int search
 insert
 delete
 **/

import Foundation

public class DoublyLinkedList<T> {
    fileprivate var _head: Node<T>?
    private var _tail: Node<T>?
    private var _length: Int = 0
    var delegate: LinkedListDelegate?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var head: Node<T>? {
        return _head
    }
    
    public var tail: Node<T>? {
        return _tail
    }
    
    public var length: Int {
        return _length
    }
    
    public init() {
    }
    
    // Adds a node to the end of the list
    public func append(value: T) {
        // Create a new node
        let newNode = Node(value: value)
        
        // Is it empty?
        if isEmpty {
            _head = newNode
            _tail = newNode
            _head?.next = _tail
            _head?.previous = _tail
            _tail?.previous = _head
            _tail?.next = _head
        } else {
            // No is not empty
            // Assign the previous of the newNode to tail
            newNode.previous = _tail
            newNode.next = _head
            
            // And tails next to be the new node
            _tail?.next = newNode
            //            _tail?.next = newNode
        }
        
        // Finally set the new node to be tail
        _tail = newNode
        _head?.previous = _tail
        
        // Incrase length by 1
        _length += 1
    }
    
    // Returns a node at a specific index
    public func nodeAt(index: Int) -> Node<T>? {
        if index >= 0 {
            var node = head
            var i = index
            while node != nil {
                if i == 0 { return node }
                i -= 1
                node = node!.next
            }
        }
        return nil
    }
    
    // Clears the list
    public func removeAll() {
        _head = nil
        _tail = nil
    }
    
    // This method will remove a node from the list
    public func remove(node: Node<T>) -> T {
        // Get the previous and next of the node to be deleted
        let prev = node.previous
        let next = node.next
        
        // Do we have a prev?
        if let prev = prev {
            // If yes, then set the prev's next to be the node's next
            prev.next = next
        } else {
            // If not then set the head to be the node's next
            _head = next
        }
        // Set the next's previous to be the prev
        next?.previous = prev
        
        // If next is actually nil
        if next == nil {
            // Then set it to be the tail
            _tail = prev
        }
        
        // Nullify the next and previous of the node which will deallocate it using ARC
        node.previous = nil
        node.next = nil
        
        // Lower the length
        _length -= 1
        
        // Returns the value
        return node.value
    }
    
}
