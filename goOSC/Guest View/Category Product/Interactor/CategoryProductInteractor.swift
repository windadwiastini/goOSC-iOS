//
//  CategoryProductInteractor.swift
//  goOSC
//
//  Created by Bootcamp on 6/11/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
import Alamofire

class CategoryProductInteractor: CategoryProductInputInteractorProtocol {
    
    var presenter: CategoryProductOutputInteractorProtocol?
    
    func sendGetProductRequest(with category: Category.NewData) {
        var url = "\(Config().url)/guest/product/search"
        if category.type == "category" {
            url = "\(url)?category=\(category.id)"
        } else {
            url = "\(url)?subcategory=\(category.id)"
        }
        print(url)
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            switch response.response?.statusCode {
            case 500?:
                let resp = HomePage.Response(code: 500, message: "Internal server error", data: [], length: 0)
                self.presenter?.response(resp, category)
            case 200?:
                do {
                    if let dataResponse = response.data {
                        let jsonDecode = try JSONDecoder().decode(HomePage.Response.self, from: dataResponse)
                        self.presenter?.response(jsonDecode, category)
                    }
                } catch {
                    print("the response can not be decoded")
                }
            case .none:
                let resp = HomePage.Response(code: 401, message: "Not Found", data: [], length: 0)
                self.presenter?.response(resp, category)
            case .some(_):
                let resp = HomePage.Response(code: 401, message: "Some error occured", data: [], length: 0)
                self.presenter?.response(resp, category)
            }
        }
    }
    
}
