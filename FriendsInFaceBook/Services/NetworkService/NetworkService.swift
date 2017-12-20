//
//  NetworkService.swift
//  FriendsInFaceBook
//
//  Created by Viktoria on 12/15/17.
//  Copyright © 2017 Victoria Kravets. All rights reserved.
//

import Foundation

public protocol NetworkService {
    func data(at url: URL, completion: @escaping (Data?, Error?) -> ()) -> NetworkTask
}

public enum NetworkServiceError: Error {
    case failed
}
