//
//  UserFactory.swift
//  FriendsInFaceBook
//
//  Created by Victoria Kravets on 05.04.2018.
//  Copyright © 2018 Victoria Kravets. All rights reserved.
//

import Foundation

public protocol UserFactory {
    
    func user() -> User
    func user(id: ID) -> User
}

fileprivate let key = "com.friendsinfacebook.user.defaults.key"
fileprivate let autoincrementedId = autoincrementedID(key: key)

public class UserRealmFactory: UserFactory {
    
    // MARK: -
    // MARK: Public
    
    public func user() -> User {
        return user(id: autoincrementedId())
    }
    
    public func user(id: ID) -> User {
        return UserImpl(id: id, persistence: RealmPersistence<RLMUser>())
    }
}
