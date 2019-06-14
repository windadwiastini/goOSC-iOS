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
        let id: Int32 = Int32(UserDefaults.standard.integer(forKey: "userId"))
        fetchReq.predicate = NSPredicate(format: "userId == \(id)")
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
    
    func deleteData(_ data: CartEntity.SingleCart) {
        let context = appDelegate.persistentContainer.viewContext
        let deleteRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Cart")
        let userIdPredicate = NSPredicate(format: "userId == \(data.userId)")
        let productIdPredicate = NSPredicate(format: "productId= %@", data.productId)
        deleteRequest.predicate = NSCompoundPredicate(type: NSCompoundPredicate.LogicalType.and , subpredicates: [userIdPredicate, productIdPredicate])
        
        do {
            let result = try context.fetch(deleteRequest)
            let objectToDelete = result[0] as! NSManagedObject
            context.delete(objectToDelete)
            do {
                try context.save()
                self.findAllData()
            } catch {
                print(error)
            }
        } catch {
            print(error)
        }
    }
}
