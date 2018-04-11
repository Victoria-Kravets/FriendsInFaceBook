//
//  PersistenceSpec.swift
//  FriendsInFaceBookTests
//
//  Created by Victoria Kravets on 09.04.2018.
//  Copyright © 2018 Victoria Kravets. All rights reserved.
//

import Quick
import Nimble

@testable import FriendsInFaceBook

class PersistanceStorage: Persistable {
    
    // MARK: -
    // MARK: Subtypes
    
    typealias Storage = [String: String]
    
    // MARK: -
    // MARK: Properties
    
    var collection: Storage
    
    // MARK: -
    // MARK: Init and Deinit
    
    public init(storage: Storage) {
        self.collection = storage
    }
    
    // MARK: -
    // MARK: Public
    
    public func read(id: ID) -> Storage {
        let valueId = "\(id)"
        
        let storage = self.collection.allKeysForValue(value: valueId)
        return storage
    }
    
    public func write(storage: Storage) {
        storage.keys.first.do { self.collection[$0] = storage.values.first }
        
        self.collection[storage.keys.first!] = storage.values.first
    }
    
    public func read<Value>(_ value: Value, to target: inout Value) {
        target = value
    }
    
    public func write<Value>(_ value: Value, to target: inout Value) {
        target = value
    }
}


class PersistenceSpec: QuickSpec {
    override func spec() {
        describe("PersistenceSpec") {
            context("when using Nimble and Quick") {
                
                var collection: [String: String] = ["Ivan": "1", "Petr": "2", "Galina": "3"]
                let persistence = PersistanceStorage(storage: collection)
                
                it("init") {
                    expect(collection).to(equal(persistence.collection))
                }
                
                it("read") {
                    let result = persistence.read(id: ID(1))
                    
                    expect(result).to(equal(["Ivan": "1"]))
                }
                
                it("read") {
                    var result = ["": ""]
                    let storageValue = persistence.read(id: ID(1))
                    
                    persistence.read(storageValue, to: &result)
                    
                    expect(result).to(equal(storageValue))
                }
                
                it("write") {
                    let oldCount = persistence.collection.count
                    
                    persistence.write(storage: ["Victoria": "4"])
                    let result = persistence.read(id: ID(4))
                    
                    expect(result).to(equal(["Victoria": "4"]))
                    expect(persistence.collection.count).to(equal(oldCount + 1))
                }
                
                it("write") {
                    var result = ["": ""]
                    let storageValue = persistence.read(id: ID(1))
                    
                    persistence.write(storageValue, to: &result)
                    
                    expect(result).to(equal(storageValue))
                }
            }
        }
    }
}

extension Dictionary where Value : Equatable {
    func allKeysForValue(value : Value) -> Dictionary {
        return self.filter { $1 == value }
    }
}


