//
//  Catst425036.swift
//  WorklightTest
//
//  Created by Luis Cuevas on 20/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class Catst425036: Mappable{
    var CHILDPRODUCTS_COUNT: String?
    var L3CategoryInfo: L3CategoryInfo?
    var ID: String?
    var CHILDCATEGORY_COUNT: Float?
    var NAME: String?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        CHILDPRODUCTS_COUNT <- map["CHILDPRODUCTS_COUNT"]
        L3CategoryInfo <- map["L3CategoryInfo"]
        ID <- map["ID"]
        CHILDCATEGORY_COUNT <- map["CHILDCATEGORY_COUNT"]
        NAME <- map["NAME"]
    }
}
