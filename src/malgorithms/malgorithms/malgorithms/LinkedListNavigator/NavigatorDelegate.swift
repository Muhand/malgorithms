//
//  NavigatorDelegate.swift
//  malgorithms
//
//  Created by Muhand Jumah on 7/29/18.
//  Copyright © 2018 Muhand Jumah. All rights reserved.
//

import Foundation

public protocol NavigatorDelegate {
    func selectionChanged<T>(newValue: T)
    func movedRight()
    func movedLeft()
}
