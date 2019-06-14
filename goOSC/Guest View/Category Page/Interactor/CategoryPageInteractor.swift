//
//  CategoryPageInteractor.swift
//  goOSC
//
//  Created by Bootcamp on 6/10/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
import Alamofire

class CategoryPageInteractor: CategoryPageInputInteractorProtocol {
    var presenter: CategoryPageOutputInteractorProtocol?
    let url = "\(Config().url)/guest/category"
    
    func sendCategoryPageRequest() {
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            switch response.response?.statusCode {
            case 500?:
                let resp = Category.Response(code: 500, message: "Internal server error", data: [])
                self.presenter?.response(resp)
            case 200?:
                let jsonDecode = try! JSONDecoder().decode(Category.Response.self, from: response.data!)
                self.presenter?.response(jsonDecode)
//                print(jsonDecode)
                print(UserDefaults.standard.string(forKey: "token") as Any)
            case .none:
                let resp = Category.Response(code: 401, message: "Not Found", data: [])
                self.presenter?.response(resp)
            case .some(_):
                let resp = Category.Response(code: 401, message: "Some error occured", data: [])
                self.presenter?.response(resp)
            }
        }
    }
    
}