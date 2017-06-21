//
//  WorklightSOMSProduct.swift
//  WorklightServices
//
//  Created by Nahum Jovan Aranda López on 15/09/15.
//  Copyright (c) 2015 Deloitte Digital. All rights reserved.
//

import UIKit

public class WorklightSOMSProduct: NSObject {
    public var quantity         : String = ""
    public var price            : String = "0.0"
    public var itemSKU          : String = ""
    public var itemDescription  : String = ""
    public var noSpotSku        : String? = ""
    public var noSpotQuantity   : String? = ""
    
    public init (quantity: String!, itemSKU: String!, itemDescription: String!, price: String!, noSpotSku: String? = nil, noSpotQuantity: String? = nil)
    {
        self.quantity           = quantity ?? ""
        self.price              = price ?? "0.0"
        self.itemSKU            = itemSKU ?? ""
        self.itemDescription    = itemDescription ?? ""
        
        self.noSpotSku          = noSpotSku
        self.noSpotQuantity     = noSpotQuantity
    }
    
    public var noSpotString: String {
        if let noSpotSku = self.noSpotSku, let noSpotQuantity = self.noSpotQuantity {
            return noSpotSku + "," + noSpotQuantity
        }
        
        return ""
    }
}
