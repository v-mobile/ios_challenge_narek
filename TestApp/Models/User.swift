//
//  User.swift
//  TestApp
//
//  Created by Narek Simonyan on 9/18/17.
//  Copyright © 2017 Narek Simonyan. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

final class User: Object, Serializable {
    
    // MARK: Declaration for string constants to be used to decode and also serialize.
    private struct SerializationKeys {
        static let picture = "picture"
        static let nat = "nat"
        static let username = "username"
        static let login = "login"
        static let location = "location"
        static let id = "id"
        static let email = "email"
        static let name = "name"
        static let phone = "phone"
        static let registered = "registered"
        static let gender = "gender"
        static let cell = "cell"
        static let dob = "dob"
    }
    
    // MARK: Properties
    public dynamic var picture: Picture?
    public dynamic var nat: String?
    public dynamic var username: String?
    public dynamic var location: Location?
    public dynamic var id: Id?
    public dynamic var email: String?
    public dynamic var name: Name?
    public dynamic var phone: String?
    public dynamic var registered: String?
    public dynamic var gender: String?
    public dynamic var cell: String?
    public dynamic var dob: String?
    
    override class func primaryKey() -> String? {
        return "email"
    }
    
    /// - parameter json: JSON object from SwiftyJSON.
    public convenience init?(json: JSON) {
        self.init()
        if json == JSON.null {
            return nil
        }
        
        picture = Picture(json: json[SerializationKeys.picture])
        nat = json[SerializationKeys.nat].string
        username = json[SerializationKeys.login].dictionary?[SerializationKeys.username]?.string
        location = Location(json: json[SerializationKeys.location])
        id = Id(json: json[SerializationKeys.id])
        email = json[SerializationKeys.email].string
        name = Name(json: json[SerializationKeys.name])
        phone = json[SerializationKeys.phone].string
        registered = json[SerializationKeys.registered].string
        gender = json[SerializationKeys.gender].string
        cell = json[SerializationKeys.cell].string
        dob = json[SerializationKeys.dob].string
    }
    
    /// - returns: A Key value pair containing all valid values in the object.
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = picture { dictionary[SerializationKeys.picture] = value.dictionaryRepresentation() }
        if let value = nat { dictionary[SerializationKeys.nat] = value }
        if let value = username { dictionary[SerializationKeys.login] = [SerializationKeys.username : value] }
        if let value = location { dictionary[SerializationKeys.location] = value.dictionaryRepresentation() }
        if let value = id { dictionary[SerializationKeys.id] = value.dictionaryRepresentation() }
        if let value = email { dictionary[SerializationKeys.email] = value }
        if let value = name { dictionary[SerializationKeys.name] = value.dictionaryRepresentation() }
        if let value = phone { dictionary[SerializationKeys.phone] = value }
        if let value = registered { dictionary[SerializationKeys.registered] = value }
        if let value = gender { dictionary[SerializationKeys.gender] = value }
        if let value = cell { dictionary[SerializationKeys.cell] = value }
        if let value = dob { dictionary[SerializationKeys.dob] = value }
        return dictionary
    }
}
