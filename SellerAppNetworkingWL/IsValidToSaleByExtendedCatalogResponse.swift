//
//  IsValidToSaleByExtendedCatalogResponse.swift
//  SellerAppNetworkingWL
//
//  Created by Alex Fierros on 04/10/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class IsValidToSaleByExtendedCatalogResponse: Mappable{
    public var skuList: [SkuList]?
    public var isSuccessful:[isSuccessful]?
    
    public required init?(map: Map){
    }
    
    public func mapping(map: Map){
        skuList <- map["skuList"]
        isSuccessful <- map["isSuccessful"]
    }
}
