//
//  CartEntity.swift
//  goOSC
//
//  Created by Bootcamp on 13/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
struct CartEntity {
    struct SingleCart {
        var name: String
        var productId: String
        var userId: Int
        var price: Double
        var thumbnail: String
        
        init(name: String, productId: String, userId: Int, price: Double, thumbnail: String) {
            self.name = name
            self.productId = productId
            self.userId = userId
            self.price = price
            self.thumbnail = thumbnail
        }
    }
}
