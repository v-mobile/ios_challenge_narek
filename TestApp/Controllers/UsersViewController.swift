//
//  UsersViewController.swift
//  TestApp
//
//  Created by Narek Simonyan on 9/18/17.
//  Copyright © 2017 Narek Simonyan. All rights reserved.
//

import UIKit
import SDWebImage
import Hero
import SwiftyJSON

class UsersViewController: UsersParentViewController {

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pTableView = tableView
        setupTableView()
        fetchUsers()
    }

    func fetchUsers() {
        
        Users.getUsers { (users, error) in
            if let error = error {
                self.showAlert(with: error.localizedDescription)
            } else if let users = users {
                self.users.append(contentsOf: users.users)
                self.filteredUsers.append(contentsOf: users.users)
                self.tableView.reloadData()
            }
        }
    }
}



