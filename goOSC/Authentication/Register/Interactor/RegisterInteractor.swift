//
//  LoginInteractor.swift
//  goOSC
//
//  Created by Bootcamp on 5/28/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
import Alamofire

class RegisterInteractor: RegisterInteractorProtocol {
    
    var presenter: RegisterPresenterProtocol?
    
    func checkPassword(password: String, repeatPassword: String) -> Bool {
        if password == repeatPassword {
            return true
        } else {
            return false
        }
    }
    
    func verifyInput(email: String, password: String, repeatPassword: String, firstName: String, lastName: String, handler: @escaping (_ complete: Bool, _ user: UserData?) -> ()) {
        if email != "" && password != "" && repeatPassword != "" && firstName != "" && lastName != "" {
            if checkPassword(password: password, repeatPassword: repeatPassword) {
                let user = UserData(firstName: firstName, lastName: lastName, email: email, password: password)
                handler(true, user)
            }
            print("Password is not matched")
            handler(false, nil)
        } else {
            print("Please fill all field")
            handler(false, nil)
        }
    }
    
    func sendRegistrationRequest(endpoint: String, user: UserData) {
        Alamofire.request(endpoint, method: .post, parameters: ["email" : user.email, "firstname" : user.firstName, "lastname" : user.lastName, "password" : user.password ], encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result {
            case .success:
                print("Success create user")
                break
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
}
