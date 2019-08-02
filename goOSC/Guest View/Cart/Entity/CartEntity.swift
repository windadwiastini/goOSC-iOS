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
        var productName: String
        var productID: String
        var price: Double
        var thumbnail: String
        var cproviderEmail: String
        
        enum CodingKeys: String, CodingKey {
            case id, thumbnail, price
            case productName = "product_name"
            case productID = "product_id"
            case cproviderEmail = "cprovider_email"
        }
    }
    
    struct Response: Decodable {
        var code: Int
        var message: String
        var data: [SingleCart]
    }
}
