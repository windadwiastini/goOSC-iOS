//
//  ExtOSCDB.swift
//  goOSC
//
//  Created by Bootcamp on 12/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
import CoreData
extension Cart {
    func addProperty(_ property: Detail.ResponseData, _ userid: String) throws {
        if property.name.count > 0 {
            self.name = property.name
            self.price = 0
            self.productId = property.id
            self.thumbnail = property.thumbnail
            self.userId = userid
        } else {
            throw NSError(domain: "", code: 100, userInfo: nil)
        }
    }
}
