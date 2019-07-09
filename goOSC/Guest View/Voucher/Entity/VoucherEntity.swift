//
//  VoucherEntity.swift
//  goOSC
//
//  Created by Bootcamp on 09/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
struct VoucherEntity {
    struct ResponseSuccess: Decodable {
        var code: Int
        var message: String
        var data: Data
    }
    
    struct Data: Decodable {
        var voucher: String
        var description: String
        var discount: Int
        var nominal: Int
        var total: Int
        var final_price: Double
    }
    
    struct ResponseFailed: Decodable {
        var code: Int
        var message: String
    }
}
