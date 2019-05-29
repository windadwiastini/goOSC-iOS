//
//  LoginInteractor.swift
//  goOSC
//
//  Created by Bootcamp on 29/05/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
import Alamofire

class LoginInteractor: LoginInputInteractorProtocol {
    var presenter: LoginOutputInteractorProtocol?
    
    func doLogin(_ customer: Customer) {
        print("do login")
        let parameters: [String: String] = [
            "email" : customer.email,
            "password" : customer.password
        ]
        Alamofire.request("\(Config().url)/auth", method: .post, parameters: parameters, encoding: JSONEncoding.default ).responseJSON {response in
            print(response)
            self.presenter?.response()
        }
    }
}
