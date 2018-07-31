//
//  LinkedListDelegate.swift
//  malgorithms
//
//  Created by Muhand Jumah on 7/29/18.
//  Copyright © 2018 Muhand Jumah. All rights reserved.
//

import Foundation

public protocol LinkedListDelegate {
    func insertedSuccessfully()
    func deletedSuccessfully()
    func failedToInsert()
    func failedtoDelete()
}
