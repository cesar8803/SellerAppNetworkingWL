//
//  WorklightEDDProduct.swift
//  SellerAppNetworkingWL
//
//  Created by David on 19/09/18.
//  Copyright © 2018 Deloitte. All rights reserved.
//

import Foundation


public class WorklightEDDProduct: NSObject {

    public var skuid            : String = ""
    public var producttype      : String = ""
    public var qty              : String = ""
    public var zipcode          : String = ""
    
    public init (skuid: String, producttype: String, qty: String, zipcode: String)
    {
        self.skuid          = skuid
        self.producttype    = producttype
        self.qty            = qty
        self.zipcode        = zipcode
    }
}


