//
//  BalancePayment.swift
//  goOSC
//
//  Created by Bootcamp on 21/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
struct BalancePayment {
    struct Data: Decodable {
        var voucher: String
        var payment_type: String
        var total: Double
        var total_discount: Double
        var final_price: Double
        var currency: String
        var product_list: [CartEntity.SingleCart]
        
        init(voucher: String, payment_type: String, total: Double, total_discount: Double, final_price: Double, currency: String, product_list: [CartEntity.SingleCart]) {
            self.voucher = voucher
            self.payment_type = payment_type
            self.total = total
            self.total_discount = total_discount
            self.final_price = final_price
            self.currency = currency
            self.product_list = product_list
        }
    }
    
    struct Response: Decodable {
        var code: Int
        var message: String
        var data: Data?
    }
    
    struct FailedResponse: Decodable {
        var code: Int
        var message: String
    }
}
