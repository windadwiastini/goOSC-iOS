//
//  ForgotPasswordView.swift
//  goOSC
//
//  Created by Bootcamp on 03/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
class ForgotPasswordView: UIViewController, ForgotPasswordViewProtocol {
    weak var presenter: ForgotPasswordPresenterProtocol?
    
    @IBOutlet weak var emailText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ForgotPasswordWireFrame.createForgotPasswordModule(self)
        presenter?.viewDidLoad()
    }
    
    @IBAction func doActionForgotPassword(_ sender: Any) {
        if let email = emailText.text {
         presenter?.interactor?.doForgotPassword(ForgotPassword.Request(email: email))
        }
    }
    
    func dissmiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
