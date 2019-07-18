//
//  CartEntity.swift
//  goOSC
//
//  Created by Bootcamp on 13/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
struct CartEntity {
    struct SingleCart: Codable {
        var id: String
        var product_name: String
        var product_id: String
        var price: Double
        var thumbnail: String
        var cprovider_email: String
        
        init(product_name: String, product_id: String, price: Double, thumbnail: String, cprovider_email: String, id: String) {
            self.product_name = product_name
            self.product_id = product_id
            self.price = price
            self.thumbnail = thumbnail
            self.id = id
            self.cprovider_email = cprovider_email
        }
    }
    
    struct Response: Decodable {
        var code: Int
        var message: String
        var data: [SingleCart]
    }
}
