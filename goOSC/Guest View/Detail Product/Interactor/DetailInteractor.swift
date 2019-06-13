//
//  DetailInteractor.swift
//  goOSC
//
//  Created by Bootcamp on 10/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
import Alamofire
class DetailInteractor: DetailInputInteractorProtocol {
    var presenter: DetailOutputInteractorProtocol?
    
    func findDetail(_ data: HomePage.Product, _ updateLike: Bool) {
        let url = "\(Config().url)/guest/product/detail?id=\(data.id)"
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            switch response.response?.statusCode {
            case 500?:
                let resp = Detail.Response(code: 500, message: "Network Error", data: nil)
                self.presenter?.response(resp, updateLike)
            case 200?:
                let jsonDecode = try! JSONDecoder().decode(Detail.Response.self, from: response.data!)
                if updateLike {
                    self.presenter?.response(jsonDecode, updateLike)
                } else {
                    self.presenter?.response(jsonDecode, updateLike)
                }
//                print(jsonDecode)
            case .none:
                let resp = Detail.Response(code: 401, message: "Not Found", data: nil)
                self.presenter?.response(resp, updateLike)
            case .some(_):
                let resp = Detail.Response(code: 401, message: "Some error occured", data: nil)
                self.presenter?.response(resp, updateLike)
            }
        }
    }
    
    func likeProduct(_ product: HomePage.Product) {
        let url = "\(Config().url)/guest/product/like?id=\(product.id)"
        Alamofire.request(url, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            switch response.response?.statusCode {
            case 500?:
                let resp = Detail.LikeResponse(code: 500, message: "Network Error", data: nil)
//                self.presenter?.response(resp)
                print(resp)
            case 200?:
                let jsonDecode = try! JSONDecoder().decode(Detail.LikeResponse.self, from: response.data!)
//                self.presenter?.response(jsonDecode)
                print(jsonDecode)
                self.findDetail(product, true)
            case .none:
                let resp = Detail.LikeResponse(code: 401, message: "Not Found", data: nil)
//                self.presenter?.response(resp)
                print(resp)
            case .some(_):
                let resp = Detail.LikeResponse(code: 401, message: "Some error occured", data: nil)
//                self.presenter?.response(resp)
                print(resp)
            }
        }
    }
}
