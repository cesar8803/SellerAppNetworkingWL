//
//  SkuList.swift
//  SellerAppNetworkingWL
//
//  Created by Alex Fierros on 04/10/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class SkuList: Mappable{
    public var sku: String?
    public var articulosDisponibles: String?
    public var isAvailableToShip: Bool?
    public var display: Bool?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        sku <- map["sku"]
        articulosDisponibles <- map["articulosDisponibles"]
        isAvailableToShip <- map["isAvailableToShip"]
        display <- map["display"]
    }
}
