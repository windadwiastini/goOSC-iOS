//
//  Category.swift
//  goOSC
//
//  Created by Bootcamp on 6/10/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation

enum Category {
    struct Response: Decodable {
        var code: Int
        var message: String
        var data: [Data]?
        
        init(code: Int, message: String, data: [Data]?) {
            self.code = code
            self.message = message
            self.data = data
        }
    }
    
    struct NewData {
        var id: Int
        var name: String
        var type: String
    }
    
    struct CellData {
        var opened = Bool()
        var category: Data
    }
    
    struct Data: Decodable {
        var category_id: Int
        var category_name: String
        var sub_category: [SubCategory]?
        var created_at: DateTime
        var updated_at: DateTime
    }
    
    struct SubCategory: Decodable {
        var subcategory_id: Int
        var category_id: Int
        var category_name: String
        var subcategory_name: String
        var created_at: DateTime
        var updated_at: DateTime
    }
    
    struct DateTime: Decodable {
        var Time: String
        var Valid: Bool
    }
}
