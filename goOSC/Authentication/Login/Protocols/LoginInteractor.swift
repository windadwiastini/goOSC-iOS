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
    
    func doLogin(_ customer: Customer.Request) {
        let parameters: [String: String] = [
            "email" : customer.email,
            "password" : customer.password
        ]
        Alamofire.request("\(Config().url)/auth", method: .post, parameters: parameters, encoding: JSONEncoding.default ).responseJSON {response in
//            print(response.response?.statusCode)
            let defaults = UserDefaults.standard
            defaults.set(false, forKey: "loggedIn")
            switch response.response?.statusCode {
            case 401?:
                let resp = Customer.Response(code: 401, message: "Email or password is not valid", data: nil)
                self.presenter?.response(resp)
            case 200?:
                let jsonDecode = try! JSONDecoder().decode(Customer.Response.self, from: response.data!)
                self.presenter?.response(jsonDecode)
                print(jsonDecode.data!.token)
                defaults.set(jsonDecode.data!.token, forKey: "token")
                defaults.set(jsonDecode.data!.user!.id, forKey: "userId")
                defaults.set(jsonDecode.data!.user!.email, forKey: "email")
                defaults.set(jsonDecode.data!.user!.firstname, forKey: "firstname")
                defaults.set(jsonDecode.data!.user!.lastname, forKey: "lastname")
                defaults.set(jsonDecode.data!.user!.role_id, forKey: "roleId")
                defaults.set(jsonDecode.data!.user!.role_name, forKey: "userName")
                defaults.set(true, forKey: "loggedIn")
            case .none:
                let resp = Customer.Response(code: 401, message: "Email or password is not valid", data: nil)
                self.presenter?.response(resp)
            case .some(_):
                let resp = Customer.Response(code: 401, message: "Email or password is not valid", data: nil)
                self.presenter?.response(resp)
            }
        }
    }
    
    func loginWithSocialMedia(type: String) {
        var requestUrl: String
        if type == "twitter" {
            requestUrl = "\(Config().url)/auth/twitter"
        } else if type == "google" {
            requestUrl = "\(Config().url)/auth/google"
        } else {
            requestUrl = "\(Config().url)/auth/facebook"
        }
        
        let delegate = Alamofire.SessionManager.default.delegate
        delegate.taskWillPerformHTTPRedirection = nil
        
        Alamofire.request(requestUrl, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { response in
            guard let url = response.response?.url else { return }
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            print("response response")
            print(response.response?.url)
            
        }
    }
}
