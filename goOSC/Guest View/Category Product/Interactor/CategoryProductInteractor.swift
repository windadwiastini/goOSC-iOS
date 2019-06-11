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
        let url = "\(Config().url)/guest/product/search?category=\(category.id)"
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            switch response.response?.statusCode {
            case 500?:
                let resp = CategoryProduct.Response(code: 500, message: "Internal server error", data: [], length: 0)
                self.presenter?.response(resp, category)
            case 200?:
                let jsonDecode = try! JSONDecoder().decode(CategoryProduct.Response.self, from: response.data!)
                self.presenter?.response(jsonDecode, category)
                print(jsonDecode)
            case .none:
                let resp = CategoryProduct.Response(code: 401, message: "Not Found", data: [], length: 0)
                self.presenter?.response(resp, category)
            case .some(_):
                let resp = CategoryProduct.Response(code: 401, message: "Some error occured", data: [], length: 0)
                self.presenter?.response(resp, category)
            }
        }
    }
    
}
