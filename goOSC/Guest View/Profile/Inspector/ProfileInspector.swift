//
//  ProfileInspector.swift
//  goOSC
//
//  Created by Bootcamp on 11/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
import Alamofire
class ProfileInteractor: ProfileInputInteractorProtocol {
    var presenter: ProfileOutputInteractorProtocol?
    let token = UserDefaults.standard.value(forKey: "token")!
    func getUserDetail() {
        let url = "\(Config().url)/dashboard/user"
        let header: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            
            print(response)
            
            switch response.response?.statusCode {
            case 500?:
                let jsonDecode = try! JSONDecoder().decode(Profile.ResponseFail.self, from: response.data!)
                self.presenter?.responseFail(response: jsonDecode)
            case 401?:
                print("error")
            //                self.presenter?.signout()
            case 200?:
                let jsonDecode = try! JSONDecoder().decode(Profile.Response.self, from: response.data!)
                self.presenter?.responSuccess(response: jsonDecode)
            case .none:
                print("error")
            case .some(_):
                print("error")
            }
        }
    }
}
