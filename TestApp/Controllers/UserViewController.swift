//
//  UserViewController.swift
//  TestApp
//
//  Created by Narek Simonyan on 9/18/17.
//  Copyright © 2017 Narek Simonyan. All rights reserved.
//

import UIKit
import SDWebImage

class UserViewController: UIViewController {

    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var natLabel: UILabel!
    @IBOutlet var dobLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var actionButton: UIBarButtonItem!
    
    var user: User?
    var heroId: String?
    var isSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupState()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        guard let user = user else {
            return
        }
        
        if isSelected {
            if !StoredData.shared.users.contains(where: {$0.email == user.email}) {
                StoredData.shared.users.append(user)
                RealmManager.shared.save(object: user)
            }
        } else {
            if let index = StoredData.shared.users.index(where: {$0.email == user.email}) {
                StoredData.shared.users.remove(at: index)
                RealmManager.shared.remove(type: user)
            }
        }
    }
    
    func setupState() {
        
        if StoredData.shared.users.contains(where:  {$0.email == user?.email}) {
            changeState()
        }
    }

    func setupView() {
        
        guard let user = user else {
            return
        }
        
        usernameLabel.text = user.username
        emailLabel.text = user.email
        dobLabel.text = user.dob
        natLabel.text = user.nat
        locationLabel.text = "State:  \(user.location?.state ?? "")\nCity:  \(user.location?.city ?? "")\nStreet:  \(user.location?.street ?? "")"
        phoneLabel.text = "Phone:  \(user.phone ?? "") \nCell:  \(user.cell ?? "")"
        userImageView.sd_setImage(with: URL(string: user.picture?.large ?? ""))
        userImageView.heroID = heroId
    }
    
    func changeState() {
        
        guard let user = user else {
            return
        }
        isSelected = !isSelected
        actionButton.title = isSelected ? "Remove" : "Save"
        if isSelected {
            if !StoredData.shared.users.contains(where: {$0.email == user.email}) {
                StoredData.shared.users.append(user)
            }
        } else {
            if let index = StoredData.shared.users.index(where: {$0.email == user.email}) {
                StoredData.shared.users.remove(at: index)
            }
        }
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        changeState()
    }
}
