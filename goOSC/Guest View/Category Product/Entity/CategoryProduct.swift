//
//  CategoryProduct.swift
//  goOSC
//
//  Created by Bootcamp on 6/11/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation

enum CategoryProduct {
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
    
    struct Product: Decodable {
        var id: String
        var name: String
        var price: Int
        var promoted_product: Bool
        var promote_title: String
        var thumbnail: String
        var preview: Preview
    }
    
    struct Preview: Decodable {
        var String: String
        var Valid: Bool
    }
}
