//
//  Model.swift
//  FriendsInFaceBook
//
//  Created by Admin on 20.02.2018.
//  Copyright © 2018 Victoria Kravets. All rights reserved.
//

import Foundation
import RealmSwift

public protocol Modelable: class {
    var id: ID { get }
    
    func write()
    func read()
    func update(_ action: () -> ())
}
public class Model<Persistence: Persistable>: Modelable where Persistence.Storage: AnyObject {
    
    // MARK: -
    // MARK: Subtypes
    
    public typealias StorageType = Persistence.Storage
    
//    // MARK: -
//    // MARK: Static
//
//    public static func instantiate(_ storage: StorageType?) -> Self? {
//        let id = storage?.id
//        return id
//            .flatMap { $0.split(separator: "_").first }
//            .flatMap { ID(string: String($0)) }
//            .map(self.init)
//    }
//
    // MARK: -
    // MARK: Properties
    
    public let id: ID
    public var storage: StorageType {
        return self.persistence.read(id: self.id)
    }
    public let persistence: Persistence
    private var lock: NSLocking = NSRecursiveLock()
    
    private var isInReadTransaction = false
    private var isInWriteTransaction = false
    
    // MARK: -
    // MARK: Init and Deinit
    
    public required init(id: ID, persistence: Persistence) {
        self.id = id
        self.persistence = persistence
        
        self.configure()
    }
    
    // MARK: -
    // MARK: Public
    
    public func read() {
        self.configureStorageTransaction(
            excluding: { isInWriteTransaction },
            condition: { isInReadTransaction = $0 },
            action: {
                self.readStorage(self.storage)
        })
    }
    
    public func write() {
        self.update {
            let storage = self.storage
            
            self.persistence.write(storage: storage)
            self.writeStorage(storage)
        }
    }
    
    public func update(_ action: () -> ()) {
        self.configureStorageTransaction(
            excluding: { isInReadTransaction },
            condition: { isInWriteTransaction = $0 },
            action: action
        )
    }
    
    // MARK: -
    // MARK: Open
    
    open func configure() {
        self.read()
    }
    
    open func readStorage(_ storage: StorageType) {
        
    }
    
    open func writeStorage(_ storage: StorageType) {
        
    }
    
    // MARK: -
    // MARK: Private
    
    private func locked(_ action: () ->()) {
        self.lock.do(action: action)
    }
    
    private func configureStorageTransaction(
        excluding: () -> (Bool),
        condition: (Bool) -> (),
        action: () -> ()
        ) {
        self.locked {
            if excluding() {
                return
            }
            condition(true)
            action()
            condition(false)
        }
    }
}
