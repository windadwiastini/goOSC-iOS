//
//  PaypalEntity.swift
//  goOSC
//
//  Created by Bootcamp on 16/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
struct PaypalEntity {
    struct Response: Decodable {
        var success: Bool
        var message: String
        var Data: SingleDataPaypal
    }
    
    struct SingleDataPaypal: Decodable {
        var ammount: Double
        var payment_data: Data
        var paypal: Bool
    }
    
    struct Data: Decodable {
        var payment_code: String
        var voucher: String
        var payment_type: String
        var total: Double
        var total_discount: Double
        var final_price: Double
        var currency: String
        var payment_status: String
        var product_list: [CartEntity.SingleCart]
    }
    
    struct ResponseDoPayment: Decodable {
        var PaymentID: String
        var PaymentMessage: String
        var PaymentState: String
    }
    
    struct FaileResponse: Decodable {
        var code: Int
        var message: String
    }
    
    struct ObjToSend: Codable {
        var voucher: String
        var total : Float
        var total_discount: Float
        var final_price: Float
        var currency: String
        var product_list: [CartEntity.SingleCart]
    }
}
