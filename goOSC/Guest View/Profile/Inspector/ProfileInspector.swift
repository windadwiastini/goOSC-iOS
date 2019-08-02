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
    let token = Auth().token
    func getUserDetail() {
        let url = "\(Config().url)/dashboard/user"
        let header: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            switch response.response?.statusCode {
            case 500?:
                do {
                    if let dataResponse = response.data {
                        let jsonDecode = try JSONDecoder().decode(Profile.ResponseFail.self, from: dataResponse)
                        self.presenter?.responseFail(response: jsonDecode)
                    }
                } catch {
                    print("the response can not be decoded")
                }
            case 200?:
                do {
                    if let dataResponse = response.data {
                        let jsonDecode = try JSONDecoder().decode(Profile.Response.self, from: dataResponse)
                        self.presenter?.responSuccess(response: jsonDecode)
                    }
                } catch {
                    print("the response can not be decoded")
                }
            case .none, .some(_):
                print("error")
            }
        }
    }
}
