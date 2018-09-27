//
//  WorklightShippingProduct.swift
//  WorklightServices
//
//  Created by Nahum Jovan Aranda López on 15/09/15.
//  Copyright (c) 2015 Deloitte Digital. All rights reserved.
//

import UIKit

public class WorklightShippingProduct: NSObject {
    public var quantity         : Int = 0
    public var price            : String = "0.0"
    public var itemSKU          : String = ""
    public var itemDescription  : String = ""
    
    public init (quantity: Int, itemSKU: String, itemDescription: String, price: String)
    {
        self.quantity           = quantity
        self.price              = price
        self.itemSKU            = itemSKU
        self.itemDescription    = itemDescription
    }
}
//public class WorklightShippingProductMKP: NSObject {
//    public var quantity         : Int = 0
//    public var itemSKU          : String = ""
//    public var offerId          : String = ""
//
//    public init (quantity: Int, itemSKU: String, offerId: String)
//    {
//        self.quantity           = quantity
//        self.itemSKU            = itemSKU
//        self.offerId            = offerId
//    }
//}

