//
//  SkuStatusChangeList.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Guillermo Cuevas García on 10/10/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class SkuStatusChangeList: Mappable{

    public var status: String?
    public var s: Double?
    public var err: String?
    public var skuId: String?
    
    public required init?(map: Map){
    }
    
    public func mapping(map: Map){
        status <- map["status"]
        s <- map["s"]
        err <- map["err"]
        skuId <- map["skuId"]
    }
}
