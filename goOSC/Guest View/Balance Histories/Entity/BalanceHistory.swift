//
//  BalanceHistory.swift
//  goOSC
//
//  Created by Bootcamp on 04/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation

struct BalancdHistory {
    struct Response: Decodable {
        var code: Int
        var message: String
        var data: Data
    }
    struct Data: Decodable {
        var count: Int
        var list: [SingleData]
    }
    
    struct SingleData: Decodable {
        var user_email: String
        var debit: Double
        var credit: Double
        var date: String
    }
}
