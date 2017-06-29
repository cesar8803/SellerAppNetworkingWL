//
//  Catst420838.swift
//  WorklightTest
//
//  Created by Luis Cuevas on 20/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class Catst420838: Mappable{
    var NAME: String?
    var ID: String?
    var CHILDPRODUCTS_COUNT: String?
    var FIRST_CHILDPRODUCT_IMG: FirstChildProductImg?
    var L3CategoryInfo: L3CategoryInfo?
    var CHILDCATEGORY_COUNT: Float?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        NAME <- map["NAME"]
        ID <- map["ID"]
        CHILDPRODUCTS_COUNT <- map["CHILDPRODUCTS_COUNT"]
        FIRST_CHILDPRODUCT_IMG <- map["FIRST_CHILDPRODUCT_IMG"]
        L3CategoryInfo <- map["L3CategoryInfo"]
        CHILDCATEGORY_COUNT <- map["CHILDCATEGORY_COUNT"]
    }
}
