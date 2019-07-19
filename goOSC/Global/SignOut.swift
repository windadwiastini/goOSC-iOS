//
//  SignOut.swift
//  goOSC
//
//  Created by Bootcamp on 05/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
class SignOut {
    func viewDidLoad(view viewVar: UIViewController) {
        
        let alert = UIAlertController(title: "Session", message: "Session Expired", preferredStyle: .alert)
        alert.view.accessibilityIdentifier = "closureAlert"
        alert.view.accessibilityValue = "closureAlert"
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
            action in
            let domain = Bundle.main.bundleIdentifier!
            UserDefaults.standard.removePersistentDomain(forName: domain)
            UserDefaults.standard.synchronize()
            let signInPage = viewVar.storyboard?.instantiateViewController(withIdentifier: "LoginView") as! Login
            LoginWireframe.createLoginModule(signInPage)
            viewVar.present(signInPage, animated: true, completion: nil)
        }))
        viewVar.present(alert, animated: true)
    }
    
    func hitSignOutButton(view viewVar: UIViewController) {
        let alert = UIAlertController(title: "", message: "See you again", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
            action in
            let domain = Bundle.main.bundleIdentifier!
            UserDefaults.standard.removePersistentDomain(forName: domain)
            UserDefaults.standard.synchronize()
            let signInPage = viewVar.storyboard?.instantiateViewController(withIdentifier: "LoginView") as! Login
            LoginWireframe.createLoginModule(signInPage)
            viewVar.present(signInPage, animated: true, completion: nil)
        }))
        viewVar.present(alert, animated: true)
    }
}
