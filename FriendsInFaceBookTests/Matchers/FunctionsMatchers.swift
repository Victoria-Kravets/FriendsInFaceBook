//
//  FunctionsMatchers.swift
//  FriendsInFaceBookTests
//
//  Created by Viktoria on 1/15/18.
//  Copyright © 2018 Victoria Kravets. All rights reserved.
//

import Quick
import Nimble

@testable import FriendsInFaceBook

//public struct ResultPredicate<Value>{
//    
//    public func beResult<Value, Error>(
//        success: ResultPredicate<(Value) -> Bool>,
//        failure: ResultPredicate<(Error) -> Bool>
//        )
//        -> Predicate<Result<Value, Error>>
//    {
//        return Predicate.define { expression in
//            let value = (try? expression.evaluate()).flatten()
//            let result: ResultPredicate<Bool> = call {
//                switch value {
//                case .success(let value)?: return success.map { $0 § value }
//                case .failure(let error)?: return failure.map { $0 § error }
//                default: return ResultPredicate(false, description: "unexpected")
//                }
//            }
//            
//            
//            return PredicateResult(bool: result.value, message: .expectedTo(result.description))
//        }
//}

