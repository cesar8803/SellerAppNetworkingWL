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
        switch map["articulosDisponibles"].currentValue {
        case (let v as String):
            articulosDisponibles = v
        case (let v as Int):
            articulosDisponibles = String(v)
        default:
            debugPrint("You should add another kind of data")
        }
        isAvailableToShip <- map["isAvailableToShip"]
        display <- map["display"]
    }
}
