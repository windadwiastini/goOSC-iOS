//
//  PaypalEntity.swift
//  goOSC
//
//  Created by Bootcamp on 16/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
struct PaypalEntity {
    struct Response: Codable {
        var success: Bool
        var message: String
        var data: SingleDataPaypal
        
        enum CodingKeys: String, CodingKey {
            case success, message
            case data = "Data"
        }
    }
    
    struct SingleDataPaypal: Codable {
        var ammount: Double
        var paymentData: Data
        var paypal: Bool
        
        enum CodingKeys: String, CodingKey {
            case ammount, paypal
            case paymentData = "payment_data"
        }
    }
    
    struct Data: Codable {
        var paymentCode: String
        var voucher: String
        var paymentType: String
        var total: Double
        var totalDiscount: Double
        var finalPrice: Double
        var currency: String
        var paymentStatus: String
        var productList: [CartEntity.SingleCart]
        
        enum CodingKeys: String, CodingKey {
            case voucher, total, currency
            case paymentCode = "payment_code"
            case paymentType = "payment_type"
            case totalDiscount = "total_discount"
            case finalPrice = "final_price"
            case paymentStatus = "payment_status"
            case productList = "product_list"
        }
    }
    
    struct ResponseDoPayment: Codable {
        var paymentID: String
        var paymentMessage: String
        var paymentState: String
        
        enum CodingKeys: String, CodingKey {
            case paymentID = "PaymentID"
            case paymentMessage = "PaymentMessage"
            case paymentState = "PaymentState"
        }
    }
    
    struct FaileResponse: Decodable {
        var code: Int
        var message: String
    }
    
    struct ObjToSend: Codable {
        var voucher: String
        var total : Float
        var totalDiscount: Float
        var finalPrice: Float
        var currency: String
        var productList: [CartEntity.SingleCart]
        
        enum CodingKeys: String, CodingKey {
            case voucher, total, currency
            case totalDiscount = "total_discount"
            case finalPrice = "final_price"
            case productList = "product_list"
        }
    }
}
