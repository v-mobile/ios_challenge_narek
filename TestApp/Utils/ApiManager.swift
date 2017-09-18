//
//  ApiManager.swift
//  TestApp
//
//  Created by Narek Simonyan on 9/18/17.
//  Copyright © 2017 Narek Simonyan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

final class ApiManager {
    
    static let shared = ApiManager()
    
    private init() {}
    
    func invokeRequestWithObject<T: Serializable>(url: String, queryParams: [String : AnyObject]? = nil, requestType: RequestMethod, headers: [String : String]? = nil, encoding: ParameterEncoding = JSONEncoding.default, complitionHandler: @escaping (T?, Error?) -> Void) {
        
        guard let url = URL(string: url) else {
            return complitionHandler(nil, nil)
        }
        
        SessionManager.default.request(url, method: requestType.type, parameters: queryParams, encoding: encoding, headers: headers)
        .responseJSON { (response) in
            if let error = response.error {
                complitionHandler(nil, error)
                return
            }
            if let error = response.result.error {
                complitionHandler(nil, error)
                return
            }
            if let result = response.result.value, let results = result as? [String : AnyObject], let jsonData = results["results"] {
                complitionHandler(T(json: JSON(jsonData)), nil)
                return
            }
            return complitionHandler(nil, nil)
        }
    }
}

enum RequestMethod {
    case get
    case put
    case post
    case delete
    case patch
    
    var type: HTTPMethod {
        switch self {
        case .get:
            return HTTPMethod.get
        case .put:
            return HTTPMethod.put
        case .post:
            return HTTPMethod.post
        case .delete:
            return HTTPMethod.delete
        case .patch:
            return HTTPMethod.patch
        }
    }
}
