//
//  CartCell.swift
//  goOSC
//
//  Created by Bootcamp on 13/06/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
import Alamofire
class CartCell: UITableViewCell {
    
    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLable: UILabel!
    func configureCell(data: CartEntity.SingleCart) {
        print("single")
        let url = Config().url + data.thumbnail
        Alamofire.request(url).responseData { (response) in
            if response.error == nil {
                print(response.result)
                if let data = response.data {
                    self.imageLabel.image = UIImage(data: data)
                }
            }
        }
        nameLabel.text = data.product_name
        priceLable.text = "\((Int(data.price)).formattedWithSeparator)"
    }
    
}
