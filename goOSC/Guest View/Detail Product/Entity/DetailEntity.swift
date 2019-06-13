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
    
    struct ResponseData: Decodable {
        var id: String
        var name: String
        var description: String
        var view_count: Int
        var like_count: Int
        var thumbnail: String
        var preview_file_type: String
        var preview: Preview
        
    }
    
    struct Preview: Decodable {
        var String: String
        var Valid: Bool
    }
    
    struct LikeResponse: Decodable {
        var code: Int
        var message: String
        var data: String?
    }
}
