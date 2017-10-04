//
//  ProductAvailableToShipSlResponse.swift
//  SellerAppNetworkingWL
//
//  Created by Alex Fierros on 04/10/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class ProductAvailableToShipSlResponse: Mappable{
    public var isSuccessful: Int?
    public var isValidToSaleByExtendedCatalogResponse: IsValidToSaleByExtendedCatalogResponse?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        isSuccessful <- map["isSuccessful"]
        isValidToSaleByExtendedCatalogResponse <- map["isValidToSaleByExtendedCatalogResponse"]
    }
}
