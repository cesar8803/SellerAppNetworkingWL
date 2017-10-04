//
//  ProductAvailableToShipBtResponse.swift
//  SellerAppNetworkingWL
//
//  Created by Alex Fierros on 04/10/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class ProductAvailableToShipBtResponse: Mappable{
    public var productAvailableToShipResponse: ProductAvailableToShipResponse?
    public var isSuccessful: Int?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        productAvailableToShipResponse <- map["ProductAvailableToShipResponse"]
        isSuccessful <- map["isSuccessful"]
    }
}
