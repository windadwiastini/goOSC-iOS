//
//  ProfileView.swift
//  goOSC
//
//  Created by Bootcamp on 11/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit

class ProfileView: UIViewController, ProfileViewProtocol {
    weak var presenter: ProfilePresenterProtocol?
    @IBOutlet weak var btnLogout: UIButton!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        ProfileWireframe.createProfileModule(self)
        presenter?.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        prepareObservable()
    }
    
    fileprivate func prepareObservable() {
        btnLogout.reactive.tap.observeNext{
            SignOut().hitSignOutButton(view: self)
        }.dispose(in: bag)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        bag.dispose()
    }
    
    func updateView(response resp: Profile.Response) {
        let data = resp.data[0]
        emailLabel.text = data.userEmail
        nameLabel.text = "\(data.firstName) \(data.lastName)"
    }
}
