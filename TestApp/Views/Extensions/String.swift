//
//  String.swift
//  TestApp
//
//  Created by Narek Simonyan on 9/18/17.
//  Copyright © 2017 Narek Simonyan. All rights reserved.
//

import Foundation

extension String {
    
    var dateFrom: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd HH-mm-ss"
        return dateFormatter.date(from: self)
    }
}
