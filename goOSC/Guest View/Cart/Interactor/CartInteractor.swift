//
//  CartInteractor.swift
//  goOSC
//
//  Created by Bootcamp on 13/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
import CoreData
class CartInteractor: CartInputInteractorProtocol {
    var presenter: CartOutputInteractorProtocol?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    func findAllData() {
        let context = appDelegate.persistentContainer.viewContext
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Cart")
        do {
            let result = try context.fetch(fetchReq)
            var kk = [CartEntity.SingleCart]()
            for dt in result as! [Cart] {
                let singleData = CartEntity.SingleCart(name: dt.name!, productId: dt.productId!, userId: Int(dt.userId), price: dt.price, thumbnail: dt.thumbnail!)
                kk.append(singleData)
            }
            presenter?.response(kk)
        } catch {
            print("failed")
        }
    }
}
