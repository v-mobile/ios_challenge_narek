//
//  UserViewCell.swift
//  TestApp
//
//  Created by Narek Simonyan on 9/18/17.
//  Copyright © 2017 Narek Simonyan. All rights reserved.
//

import UIKit

class UserViewCell: UITableViewCell {

    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var userImageView: RoundedImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
