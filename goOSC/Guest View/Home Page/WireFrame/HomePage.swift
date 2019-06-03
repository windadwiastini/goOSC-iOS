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
        var data: [ResponseData?]
        var length: Int
        
        init(code: Int, message: String, data: [ResponseData?], length: Int) {
            self.code = code
            self.message = message
            self.data = data
            self.length = length
        }
    }
    
    struct ResponseData: Decodable {
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
