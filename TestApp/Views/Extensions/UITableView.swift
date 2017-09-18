//
//  UITableView.swift
//  TestApp
//
//  Created by Narek Simonyan on 9/18/17.
//  Copyright © 2017 Narek Simonyan. All rights reserved.
//

import UIKit

extension UITableView {
    
    var noResultLabel: UILabel {
        get {
            return getAssociatedValue(key: "uiLabel", object: self, initialValue: UILabel())
        }
        set {
            set(associatedValue: newValue, key: "uiLabel", object: self)
        }
    }

    func showNoData(text: String, headerOffset: CGFloat = 50) {
        
        noResultLabel.text = text
        noResultLabel.textAlignment = .center
        noResultLabel.translatesAutoresizingMaskIntoConstraints = false
        noResultLabel.numberOfLines = 0
        noResultLabel.textColor = UIColor.black
        noResultLabel.font = UIFont.systemFont(ofSize: 15)
        
        addSubview(noResultLabel)
        addConstraint(NSLayoutConstraint(item: noResultLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: headerOffset))
        addConstraint(NSLayoutConstraint(item: noResultLabel, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0))
        addConstraint(NSLayoutConstraint(item: noResultLabel, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 0.9, constant: 0))
    }
    
    func removeNoData() {
        noResultLabel.removeFromSuperview()
    }
}
