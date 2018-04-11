//
//  UserViewController.swift
//  FriendsInFaceBook
//
//  Created by Victoria Kravets on 05.04.2018.
//  Copyright © 2018 Victoria Kravets. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    public var userView: UserView? {
        return cast(self.viewIfLoaded)
    }

    public var user: User? {
        didSet {
            userView?.user = user
        }
    }
    
    // MARK: -
    // MARK: View Lifecycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userView?.user = self.user
    }
}
