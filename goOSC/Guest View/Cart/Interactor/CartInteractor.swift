//
//  CartInteractor.swift
//  goOSC
//
//  Created by Bootcamp on 13/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
import CoreData
import Alamofire
class CartInteractor: CartInputInteractorProtocol {
    var presenter: CartOutputInteractorProtocol?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let token = Auth().token
    func findAllData() {
        let url = "\(Config().url)/cart"
        let header: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            print(response)
            switch response.response?.statusCode {
            case 500?:
                print("error")
            case 401?:
                self.presenter?.signout()
            case 200?:
                let jsonDecode = try! JSONDecoder().decode(CartEntity.Response.self, from: response.data!)
                self.presenter?.response(jsonDecode)
            case .none:
                print("error")
            case .some(_):
                print("error")
            }
        }
    }
    
    func deleteData(_ data: CartEntity.SingleCart) {
        let url = "\(Config().url)/cart/\(data.id)"
        let header: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]
        Alamofire.request(url, method: .delete, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            print(response)
            switch response.response?.statusCode {
            case 500?:
                print("error")
            case 200?:
                self.findAllData()
            case .none:
                print("error")
            case .some(_):
                print("error")
            }
        }
    }
}
