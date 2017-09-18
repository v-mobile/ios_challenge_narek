//
//  Users.swift
//  TestApp
//
//  Created by Narek Simonyan on 9/18/17.
//  Copyright © 2017 Narek Simonyan. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

final class Users: Serializable {
    
    var users: [User] = []
    
    /// Initiates the instance based on the JSON that was passed.
    ///
    /// - parameter json: JSON object from SwiftyJSON.
    public convenience init?(json: JSON) {
        self.init()
        
        guard let jsonArray = json.array else {
            return nil
        }
        
        for item in jsonArray {
            if let user = User(json: item) {
                users.append(user)
            }
        }
    }
    
    static func getUsers(complitionHandler: @escaping (Users?,Error?)->Void) {
    
        ApiManager.shared.invokeRequestWithObject(url: "https://randomuser.me/api/?results=150", requestType: .get) { (users: Users?, error: Error?) in
            complitionHandler(users, error)
        }
    }
}
