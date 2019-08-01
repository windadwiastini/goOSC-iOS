//
//  Cart+CoreDataProperties.swift
//  
//
//  Created by Bootcamp on 01/08/19.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Cart {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cart> {
        return NSFetchRequest<Cart>(entityName: "Cart")
    }

    @NSManaged public var name: String?
    @NSManaged public var price: Double
    @NSManaged public var productId: String?
    @NSManaged public var thumbnail: String?
    @NSManaged public var userId: Int32

}
