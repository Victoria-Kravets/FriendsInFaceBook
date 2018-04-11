//
//  ModelSpec.swift
//  FriendsInFaceBookTests
//
//  Created by Admin on 26.02.2018.
//  Copyright © 2018 Victoria Kravets. All rights reserved.
//

import Quick
import Nimble

@testable import FriendsInFaceBook

class ModelSpec: QuickSpec {
    override func spec() {
        let id = ID(1)
        let model = Model(id: id, persistence: RealmPersistence<RLMModel>())
        
        describe("ModelSpec") {
            context("id") {
                it("should pass") {
                    expect(model.id.value).to(equal(id.value))
                }
            }
            
            context("storage") {
                it("should pass") {
                    expect(model.storage.realm?.isEmpty).to(beFalse())
                }
            }
            
            context("persistence") {
                it("should pass") {
                    let resultModel = model.persistence.read(id: id)
                    let modelId = "1_realmpersistence<rlmmodel>"
                    expect(resultModel.id).to(equal(modelId))
                }
            }
            
            context("init") {
                it("should pass") {
                    
                    expect(true).to(beTrue())
                }
            }
        }
    }
}

