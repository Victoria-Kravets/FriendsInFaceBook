//
//  ViewController.swift
//  FriendsInFaceBook
//
//  Created by Viktoria on 11/27/17.
//  Copyright © 2017 Victoria Kravets. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: -
    // MARK: Properties
    
    let loginView = LoginView()
    let hasToken = FacebookSocialService.shared.alreadyLoggedIn()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(loginView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if hasToken {
            self.loginView.loginButton?.isHidden = true
            self.loginView.welcomeLabel?.isHidden = true
            self.goToNextViewController()
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if hasToken {
           self.goToNextViewController()
        }
    }
    
    // MARK: -
    // MARK: Private
    
    private func goToNextViewController(){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "GoToSeeFriends") as? UINavigationController
        nextViewController.do({ nextVC in
             self.present(nextVC, animated:true, completion:nil)
        })
    }
}

