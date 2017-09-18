//
//  Date.swift
//  TestApp
//
//  Created by Narek Simonyan on 9/18/17.
//  Copyright © 2017 Narek Simonyan. All rights reserved.
//

import Foundation

extension Date {
    
    var yearsFromNow: Int? {
        let ageComponents = Calendar.current.dateComponents([.year], from: self, to: Date())
        return ageComponents.year
    }
}
