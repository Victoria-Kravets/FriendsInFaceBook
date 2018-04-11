//
//  UserView.swift
//  FriendsInFaceBook
//
//  Created by Victoria Kravets on 05.04.2018.
//  Copyright © 2018 Victoria Kravets. All rights reserved.
//

import UIKit

class UserView: UIView {

    @IBOutlet private var nameLabel: UILabel?
    @IBOutlet private var ageLabel: UILabel?
    
    public var user: User? {
        didSet { self.fill(with: user) }
    }
    
    private func fill(with model: User?) {
        let update = { [weak self, weak user] in
            self?.nameLabel?.text = user?.name.map { "Name: \($0)" }
            self?.ageLabel?.text = user?.age.map { "Age: \($0)" }
        }
        
        self.user?.didChanged = update
        
        update()
    }
}
