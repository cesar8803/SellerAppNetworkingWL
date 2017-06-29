//
//  Catst420841.swift
//  WorklightTest
//
//  Created by Luis Cuevas on 20/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class Catst420841: Mappable{
    public var NAME: String?
    public var ID: String?
    public var CHILDPRODUCTS_COUNT: String?
    public var FIRST_CHILDPRODUCT_IMG: FirstChildProductImg?
    public var L3CategoryInfo: L3CategoryInfo?
    public var CHILDCATEGORY_COUNT: Float?
    
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
