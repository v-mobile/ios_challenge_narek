//
//  UsersParentViewController.swift
//  TestApp
//
//  Created by Narek Simonyan on 9/18/17.
//  Copyright © 2017 Narek Simonyan. All rights reserved.
//

import UIKit
import SwiftyJSON

class UsersParentViewController: UIViewController {
    
    var pTableView: UITableView?
    let searchBar = UISearchBar()
    var filteredUsers: [User] = []
    var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureSearchBar()
    }

    func setupTableView() {
        
        pTableView?.register(UINib(nibName: "UserViewCell", bundle: nil), forCellReuseIdentifier: "UserViewCell")
        pTableView?.reloadData()
    }
    
    func configureSearchBar() {
        
        searchBar.delegate = self
        searchBar.placeholder = "Search with first name, last name"
    }
}

extension UsersParentViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if users.isEmpty {
            return CGFloat.leastNormalMagnitude
        }
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "UserViewController") as! UserViewController
        controller.user = User(json: JSON(filteredUsers[indexPath.row].dictionaryRepresentation()))
        controller.heroId = (filteredUsers[indexPath.row].email ?? "")
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension UsersParentViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserViewCell") as! UserViewCell
        let user = filteredUsers[indexPath.row]
        if let date = user.dob?.dateFrom, let year = date.yearsFromNow {
            cell.ageLabel.text = "\(String(year)) years old"
        } else {
            cell.ageLabel.text = ""
        }
        cell.usernameLabel.text = "\(user.name?.title ?? "") \(user.name?.first ?? "") \(user.name?.last ?? "")"
        cell.userImageView.sd_setImage(with: URL(string: user.picture?.medium ?? ""))
        cell.userImageView.heroID = (user.email ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if users.isEmpty {
            return nil
        }
        return searchBar
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredUsers.count
    }
}

extension UsersParentViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText == "" {
            filteredUsers = users
            pTableView?.reloadData()
            return
        }
        
        let lowerCased = searchText.lowercased()
        filteredUsers = users.filter({($0.name?.first ?? "").contains(lowerCased) || ($0.name?.last ?? "").contains(lowerCased)})
        
        if filteredUsers.isEmpty {
            pTableView?.showNoData(text: "No search results")
        } else {
            pTableView?.removeNoData()
        }
        pTableView?.reloadData()
    }
}
