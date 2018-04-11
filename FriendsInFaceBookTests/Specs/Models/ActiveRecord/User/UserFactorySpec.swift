//
//  UserFactorySpec.swift
//  FriendsInFaceBookTests
//
//  Created by Victoria Kravets on 11.04.2018.
//  Copyright © 2018 Victoria Kravets. All rights reserved.
//

import Quick
import Nimble

@testable import FriendsInFaceBook

class UserFactorySpec: QuickSpec {
    override func spec() {
        describe("UserFactorySpec") {
            context("user") {
                it("should pass when userFactory provides User") {
                    let user = UserRealmFactory().user()
                    expect(user is User).to(beTrue())
                }
            }
        }
    }
}

