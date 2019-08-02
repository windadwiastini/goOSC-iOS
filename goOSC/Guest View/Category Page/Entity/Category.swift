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
    
    struct Data: Codable {
        var categoryID: Int
        var categoryName: String
        var subCategory: [SubCategory]?
        var createdAt: DateTime
        var updatedAt: DateTime
        
        enum CodingKeys: String, CodingKey {
            case categoryID = "category_id"
            case categoryName = "category_name"
            case subCategory = "sub_category"
            case createdAt = "created_at"
            case updatedAt = "updated_at"
        }
    }
    
    struct SubCategory: Codable {
        var subcategoryID: Int
        var categoryID: Int
        var categoryName: String
        var subcategoryName: String
        var createdAt: DateTime
        var updatedAt: DateTime
        
        enum CodingKeys: String, CodingKey {
            case subcategoryID = "subcategory_id"
            case categoryID = "category_id"
            case categoryName = "category_name"
            case subcategoryName = "subcategory_name"
            case createdAt = "created_at"
            case updatedAt = "updated_at"
        }
    }
    
    struct DateTime: Codable {
        var time: String
        var valid: Bool
        
        enum CodingKeys: String, CodingKey {
            case time = "Time"
            case valid = "Valid"
        }
    }
}
