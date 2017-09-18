//
//  Picture.swift
//  TestApp
//
//  Created by Narek Simonyan on 9/18/17.
//  Copyright © 2017 Narek Simonyan. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

final class Picture: Object, Serializable {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let large = "large"
        static let thumbnail = "thumbnail"
        static let medium = "medium"
    }
    
    // MARK: Properties
    public dynamic var large: String?
    public dynamic var thumbnail: String?
    public dynamic var medium: String?
    
    // MARK: SwiftyJSON Initializers
    
    /// - parameter json: JSON object from SwiftyJSON.
    public convenience init?(json: JSON) {
        
        self.init()
        if json == JSON.null {
            return nil
        }
        large = json[SerializationKeys.large].string
        thumbnail = json[SerializationKeys.thumbnail].string
        medium = json[SerializationKeys.medium].string
    }
    
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = large { dictionary[SerializationKeys.large] = value }
        if let value = thumbnail { dictionary[SerializationKeys.thumbnail] = value }
        if let value = medium { dictionary[SerializationKeys.medium] = value }
        return dictionary
    }
}
