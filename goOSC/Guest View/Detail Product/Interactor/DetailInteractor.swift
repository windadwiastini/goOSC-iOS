//
//  DetailInteractor.swift
//  goOSC
//
//  Created by Bootcamp on 10/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
import Alamofire
import CoreData
class DetailInteractor: DetailInputInteractorProtocol {
    var presenter: DetailOutputInteractorProtocol?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    func findDetail(_ data: HomePage.Product) {
        let url = "\(Config().url)/guest/product/detail?id=\(data.id)"
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            switch response.response?.statusCode {
            case 500?:
                let resp = Detail.Response(code: 500, message: "Network Error", data: nil)
                self.presenter?.response(resp)
            case 200?:
                
                let jsonDecode = try! JSONDecoder().decode(Detail.Response.self, from: response.data!)
                self.presenter?.response(jsonDecode)
            case .none:
                let resp = Detail.Response(code: 401, message: "Not Found", data: nil)
                self.presenter?.response(resp)
            case .some(_):
                let resp = Detail.Response(code: 401, message: "Some error occured", data: nil)
                self.presenter?.response(resp)
            }
        }
    }
    
    func insertCartToDB(_ data: HomePage.Product, _ userId: Int)  {
        let context = appDelegate.persistentContainer.viewContext
        guard let cart = NSEntityDescription.insertNewObject(forEntityName: "Cart", into: context) as? Cart else {
            print("Error : failed to create a new object")
            return
        }
        
        do {
            try cart.addProperty(data, userId)
            print("Data successfully inserted")
        } catch {
            print("Error")
            context.delete(cart)
        }
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("coudnt save the data")
            }
            context.reset()
        }
        
    }
}
