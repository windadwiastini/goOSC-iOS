//
//  CategoryProductCell.swift
//  goOSC
//
//  Created by Bootcamp on 6/11/19.
//  Copyright © 2019 Swift Bootcamp. All rights reserved.
//

import UIKit
import Alamofire

class CategoryProductCell: UITableViewCell {
    
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    func configureCell(product: CategoryProduct.Product ) {
        let url = Config().url + product.thumbnail
        Alamofire.request(url).responseData { (response) in
            if response.error == nil {
                print(response.result)
                if let data = response.data {
                    self.picture.image = UIImage(data: data)
                }
            }
        }
        nameLabel.text = product.name
        priceLabel.text = "\((product.price).formattedWithSeparator)"
    }
    
}
