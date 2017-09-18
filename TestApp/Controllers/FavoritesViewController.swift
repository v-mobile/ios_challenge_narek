//
//  FavoritesViewController.swift
//  TestApp
//
//  Created by Narek Simonyan on 9/18/17.
//  Copyright © 2017 Narek Simonyan. All rights reserved.
//

import UIKit
import SwiftyJSON

class FavoritesViewController: UsersParentViewController {

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pTableView = tableView
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupData()
        if filteredUsers.isEmpty {
            tableView.showNoData(text: "No Favorites")
        } else {
            tableView.removeNoData()
        }
        tableView.reloadData()
    }
    
    func setupData() {
        
        users = StoredData.shared.users
        filteredUsers = StoredData.shared.users
    }
}
