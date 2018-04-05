//
//  Persistence.swift
//  FriendsInFaceBook
//
//  Created by Victoria Kravets on 05.04.2018.
//  Copyright © 2018 Victoria Kravets. All rights reserved.
//

import Foundation

public protocol Persistable {
    associatedtype Storage
    
    func read(id: ID) -> Storage
    func write(storage: Storage)
    
    func read<Value>(_ value: Value, to target: inout Value)
    func write<Value>(_ value: Value, to target: inout Value)
}
