//
//  FriendsInFaceBookUITests.swift
//  FriendsInFaceBookUITests
//
//  Created by Viktoria on 12/3/17.
//  Copyright © 2017 Victoria Kravets. All rights reserved.
//
import UIKit
import XCTest
import  ObjectMapper
import PromiseKit
import RealmSwift
import FBSDKLoginKit
import FBSDKCoreKit

import FriendsInFaceBook

class FriendsInFaceBookUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    func testfe(){
        
    }
    func testLogoutButton() {
        if ApiLayer.shared.alreadyLoggedIn(){
            self.app.navigationBars["Friends"].buttons["Log Out"].tap()
            self.app.alerts["Log Out"].buttons["Yes"].tap()
            XCTAssertFalse(ApiLayer.shared.alreadyLoggedIn())
        }
        
        
        
    }
    
}
