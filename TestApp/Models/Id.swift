//
//  Id.swift
//  TestApp
//
//  Created by Narek Simonyan on 9/18/17.
//  Copyright © 2017 Narek Simonyan. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

final class Id: Object, Serializable {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let name = "name"
        static let value = "value"
    }
    
    // MARK: Properties
    public dynamic var name: String?
    public dynamic var value: String?

    /// - parameter json: JSON object from SwiftyJSON.
    public convenience init?(json: JSON) {
        self.init()
        if json == JSON.null {
            return nil
        }
        
        name = json[SerializationKeys.name].string
        value = json[SerializationKeys.value].string
    }
    
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = name { dictionary[SerializationKeys.name] = value }
        return dictionary
    }
}
