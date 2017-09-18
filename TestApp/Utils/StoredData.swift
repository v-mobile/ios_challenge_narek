//
//  StoredData.swift
//  TestApp
//
//  Created by Narek Simonyan on 9/18/17.
//  Copyright © 2017 Narek Simonyan. All rights reserved.
//

import Foundation

class StoredData {
    
    static let shared = StoredData()
    var users: [User] = []
    
    private init() {}
}
