//
//  ProductAvailableToShipResponse.swift
//  SellerAppNetworkingWL
//
//  Created by Alex Fierros on 04/10/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class ProductAvailableToShipResponse: Mappable{
    public var skuList: [SkuList]?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        skuList <- map["skuList"]
    }
}
