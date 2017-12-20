//
//  ImageDownloadService.swift
//  FriendsInFaceBook
//
//  Created by Viktoria on 12/15/17.
//  Copyright © 2017 Victoria Kravets. All rights reserved.
//

import Foundation
import UIKit

public protocol ImageDownloadService {
    func fetchImage(url: URL, completion: @escaping (UIImage?) -> ()) -> NetworkTask
}
