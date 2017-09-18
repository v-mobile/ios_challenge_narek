//
//  Location.swift
//  TestApp
//
//  Created by Narek Simonyan on 9/18/17.
//  Copyright © 2017 Narek Simonyan. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

final class Location: Object, Serializable {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let state = "state"
        static let street = "street"
        static let city = "city"
        static let postcode = "postcode"
    }
    
    // MARK: Properties
    public dynamic var state: String?
    public dynamic var street: String?
    public dynamic var city: String?
    public dynamic var postcode: Int = 0
    
    /// - parameter json: JSON object from SwiftyJSON.
    public convenience init?(json: JSON) {
        
        self.init()
        if json == JSON.null {
            return nil
        }
        state = json[SerializationKeys.state].string
        street = json[SerializationKeys.street].string
        city = json[SerializationKeys.city].string
        postcode = json[SerializationKeys.postcode].int ?? 0
    }
    
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = state { dictionary[SerializationKeys.state] = value }
        if let value = street { dictionary[SerializationKeys.street] = value }
        if let value = city { dictionary[SerializationKeys.city] = value }
        dictionary[SerializationKeys.postcode] = postcode
        return dictionary
    }
}
