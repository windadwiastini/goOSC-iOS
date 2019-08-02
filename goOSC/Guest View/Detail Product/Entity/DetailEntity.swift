//
//  DetailEntity.swift
//  goOSC
//
//  Created by Bootcamp on 10/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
enum Detail {
    struct Response: Decodable {
        var code: Int
        var message: String
        var data: ResponseData?
        
        init(code: Int, message: String, data: ResponseData?) {
            self.code = code
            self.message = message
            self.data = data
        }
    }
    
    struct ResponseData: Codable {
        var id: String
        var name: String
        var description: String
        var viewCount: Int
        var likeCount: Int
        var thumbnail: String
        var previewFileType: String
        var preview: Preview
        var category: String
        var price: Double
        
        enum CodingKeys: String, CodingKey {
            case id, name, description, thumbnail, preview, category, price
            case viewCount = "view_count"
            case likeCount = "like_count"
            case previewFileType = "preview_file_type"
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
    
    struct LikeResponse: Decodable {
        var code: Int
        var message: String
        var data: String?
    }
}
