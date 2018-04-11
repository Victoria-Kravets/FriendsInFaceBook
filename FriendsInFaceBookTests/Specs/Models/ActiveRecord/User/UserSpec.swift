//
//  UserSpec.swift
//  FriendsInFaceBookTests
//
//  Created by Victoria Kravets on 10.04.2018.
//  Copyright © 2018 Victoria Kravets. All rights reserved.
//

import Quick
import Nimble
import RealmSwift

@testable import FriendsInFaceBook

class UserSpec: QuickSpec {
    override func spec() {
        let idFactory = autoincrementedID(key: "user")
        
        let name = "Ivan"
        let age = 20
        
        let user = UserImpl(id: idFactory(), persistence: RealmPersistence<RLMUser>())
        
        user.name = name
        user.age = age
        
        describe("UserSpec") {
            context("name") {
                it("should pass when userName isn't nil") {
                    expect(user.name).to(equal(name))
                }
            }
            
            context("age") {
                it("should pass when userAge isn't nil") {
                    expect(user.age).to(equal(age))
                }
            }
            
//            context("write") {
//                it("should pass") {
//
//                    expect().to(beTrue())
//                }
//            }
            
            context("writeStorage") {
                it("should pass") {
                    let user2 = UserImpl(id: idFactory(), persistence: RealmPersistence<RLMUser>())
                    user2.name = "Vasya"
                    user2.age = 31
                    user2.writeStorage(user2.storage)
                    user2.write()
                    print(user2.storage.id)
                    let recordedUser = user2.persistence.read(id: ID(42))
                    print(recordedUser.name)
                    print(user2.name)

                }
            }
            
            context("readStorage") {
                it("should pass") {
                    
                    expect(true).to(beTrue())
                }
            }
        }
    }
}



