//
//  Catst420840.swift
//  WorklightTest
//
//  Created by Luis Cuevas on 20/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class Catst420840: Mappable{
    public var CHILDPRODUCTS_COUNT: String?
    public var L3CategoryInfo: L3CategoryInfo?
    public var ID: String?
    public var CHILDCATEGORY_COUNT: Float?
    public var NAME: String?
    
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
