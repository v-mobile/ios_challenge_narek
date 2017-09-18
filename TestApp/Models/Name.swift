//
//  Name.swift
//  TestApp
//
//  Created by Narek Simonyan on 9/18/17.
//  Copyright © 2017 Narek Simonyan. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

final class Name: Object, Serializable {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let first = "first"
        static let title = "title"
        static let last = "last"
    }
    
    // MARK: Properties
    public dynamic var first: String?
    public dynamic var title: String?
    public dynamic var last: String?

    /// - parameter json: JSON object from SwiftyJSON.
    public convenience init?(json: JSON) {
        
        self.init()
        if json == JSON.null {
            return nil
        }
        
        first = json[SerializationKeys.first].string
        title = json[SerializationKeys.title].string
        last = json[SerializationKeys.last].string
    }
    
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = first { dictionary[SerializationKeys.first] = value }
        if let value = title { dictionary[SerializationKeys.title] = value }
        if let value = last { dictionary[SerializationKeys.last] = value }
        return dictionary
    }
}
