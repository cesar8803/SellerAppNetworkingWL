//
//  WorklightSOMSEdd.swift
//  SellerAppNetworkingWL
//
//  Created by Daniel Beltran on 13/11/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import UIKit

public class WorklightSOMSEdd: NSObject {
    public var quantity         : String = ""
    public var itemSKU          : String = ""
    public var cp               : String = ""
    public var tipoProducto     : String? = ""
    
    public init (quantity: String!, itemSKU: String!, cp: String!, tipoProducto: String!)
    {
        self.quantity           = quantity ?? ""
        self.itemSKU            = itemSKU ?? ""
        self.cp                 = cp ?? ""
        self.tipoProducto       = tipoProducto
    }
    
}
