//
//  ProfileView.swift
//  goOSC
//
//  Created by Bootcamp on 11/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

class ProfileView: UIViewController, ProfileViewProtocol {
    var presenter: ProfilePresenterProtocol?
    @IBOutlet weak var btnLogout: UIButton!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        ProfileWireframe.createProfileModule(self)
        presenter?.viewDidLoad()
        
        btnLogout.reactive.tap.observeNext{
            SignOut().hitSignOutButton(view: self)
        }
    }
    
    func updateView(response resp: Profile.Response) {
        emailLabel.text = resp.data[0].user_email
        nameLabel.text = "\(resp.data[0].first_name) \(resp.data[0].last_name)"
    }
}
