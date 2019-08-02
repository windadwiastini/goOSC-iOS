//
//  HomePahe.swift
//  goOSC
//
//  Created by Bootcamp on 6/3/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation

enum HomePage {
    struct Response: Decodable {
        var code: Int
        var message: String
        var data: [Product?]
        var length: Int
        
        init(code: Int, message: String, data: [Product?], length: Int) {
            self.code = code
            self.message = message
            self.data = data
            self.length = length
        }
    }
    
    struct Product: Codable {
        var id: String
        var name: String
        var price: Int
        var promotedProduct: Bool
        var promoteTitle: String
        var thumbnail: String
        var preview: Preview
        
        enum CodingKeys: String, CodingKey {
            case id, name, price, thumbnail, preview
            case promotedProduct = "promoted_product"
            case promoteTitle = "promote_title"
        }
        
    }
    
    struct Preview: Codable {
        var string: String
        var valid: Bool
        
        enum CodingKeys: String, CodingKey {
            case string = "String"
            case valid = "Valid"
        }
    }
}
