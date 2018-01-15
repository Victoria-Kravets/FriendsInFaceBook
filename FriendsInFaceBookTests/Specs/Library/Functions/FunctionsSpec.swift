//
//  FunctionsSpec.swift
//  FriendsInFaceBookTests
//
//  Created by Viktoria on 1/15/18.
//  Copyright © 2018 Victoria Kravets. All rights reserved.
//

import Quick
import Nimble

@testable import FriendsInFaceBook

class FunctionsSpec: QuickSpec {
    override func spec() {
        let value = 1
        
        describe("identity") {
            it("valueResult should be equal 1") {
                let valueResult = identity(value)
                expect(valueResult).to(equal(value))
            }
        }
        describe("cast") {
            it("") {
                let value: Any? = 1
                let result: Int? = value.flatMap(cast)
                expect(value as? Int).to(equal(result))
            }
        }
        describe("ignoreInput") {
            it("") {
                let function: (Int) -> Bool = ignoreInput { true }
                let result = function(value)
                expect(result).to(beTrue())
            }
        }
        describe("returnValue") {
            it("") {
                let function: () -> Int =  returnValue(value)
                let result = function()
                expect(result).to(equal(value))
            }
        }
        describe("call") {
            it("") {
                let function: () -> Int =  {return value}
                let result = call(function)
                expect(value).to(equal(result))
            }
        }
        describe("scope") {
            it("") {
                var value = 1
                scope{value += 1}
                let result = value
                expect(value).to(equal(result))
            }
        }
//        describe("curry") {
//            it("should return .success, when Value is passed as parameter") {
//                expect(valueResult).to(beSuccess(value: value))
//            }
//            
//            it("should return .failure, when Value is passed as parameter") {
//                expect(errorResult).to(beFailure(error: error))
//            }
//        }
        //        describe("curry") {
        //            it("") {
        //                let function: (Bool, Int) -> Int  = self.fun1
        //                let resultFunction: (Bool) -> (Int) -> Int
        //                let funcj = curry(function)
        //                expect(resultFunction as (Bool) -> (Int) -> Int).to(equal(funcj as (Bool) -> (Int) -> Int))
        //            }
        //        }
    }
    
}

