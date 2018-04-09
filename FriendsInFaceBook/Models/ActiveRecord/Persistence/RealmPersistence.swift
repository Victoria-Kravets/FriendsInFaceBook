//
//  RealmPersistence.swift
//  FriendsInFaceBook
//
//  Created by Victoria Kravets on 05.04.2018.
//  Copyright © 2018 Victoria Kravets. All rights reserved.
//

import Foundation
import RealmSwift

public class RealmPersistence<Storage: RLMModel>: Persistable {
    
    // MARK: -
    // MARK: Subtypes
    
    public typealias RealmFactory = () -> (Realm?)
    
    // MARK: -
    // MARK: Properties
    
    public let realmFactory: RealmFactory
    
    // MARK: -
    // MARK: Init and Deinit
    
    public init(realmFactory: @escaping RealmFactory = { Realm.current }) {
        self.realmFactory = realmFactory
    }
    
    // MARK: -
    // MARK: Public
    
    public func read(id: ID) -> Storage {
        let realmId = "\(id)_\(typeString(self).lowercased())"
        
        let realm = self.realmFactory()
        return realm?.object(ofType: Storage.self, forPrimaryKey: realmId)
            ?? modify(Storage()) { storage in
                storage.id = realmId
                realm?.write { $0.add(storage, update: true) }
        }
    }
    
    public func write(storage: Storage) {
        self.realmFactory()?.write { $0.add(storage) }
    }
    
    public func read<Value>(_ value: Value, to target: inout Value) {
        target = value
    }
    
    public func write<Value>(_ value: Value, to target: inout Value) {
        target = value
    }
}
