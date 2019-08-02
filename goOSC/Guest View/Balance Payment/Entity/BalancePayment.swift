//
//  BalancePayment.swift
//  goOSC
//
//  Created by Bootcamp on 21/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
struct BalancePayment {
    struct Data: Codable {
        var voucher: String
        var paymentType: String
        var total: Double
        var totalDiscount: Double
        var finalPrice: Double
        var currency: String
        var productList: [CartEntity.SingleCart]
        
        enum CodingKeys: String, CodingKey {
            case voucher, total, currency
            case paymentType = "payment_type"
            case totalDiscount = "total_discount"
            case finalPrice = "final_price"
            case productList = "product_list"
        }
    }
    
    struct Response: Decodable {
        var code: Int
        var message: String
        var data: Data
    }
    
    struct FailedResponse: Decodable {
        var code: Int
        var message: String
    }
    
    struct PaymentResponse: Decodable {
        var message: String
        var success: Bool
    }
}
