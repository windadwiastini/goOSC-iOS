//
//  JsonManipulate.swift
//  goOSC
//
//  Created by Bootcamp on 19/07/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import Foundation
class JsonManipulate {
    func JSONStringify(value: [String: String],prettyPrinted:Bool = false) -> String{
        let options = prettyPrinted ? JSONSerialization.WritingOptions.prettyPrinted : JSONSerialization.WritingOptions(rawValue: 0)
        if JSONSerialization.isValidJSONObject(value) {
            do{
                let data = try JSONSerialization.data(withJSONObject: value, options: options)
                if let string = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                    return string as String
                }
            }catch {
                print("error")
            }
        }
        return ""
    }
}
