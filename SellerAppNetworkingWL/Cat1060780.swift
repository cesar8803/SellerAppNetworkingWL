//
//  Cat1060780.swift
//  WorklightTest
//
//  Created by Luis Cuevas on 20/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class Cat1060780: Mappable{
    public var L2CategoryInfo: L2CategoryInfo?
    public var CHILDPRODUCTS_COUNT: String?
    public var NAME: String?
    public var ID: String?
    public var CHILDCATEGORY_COUNT: Float?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        L2CategoryInfo <- map["L2CategoryInfo"]
        CHILDPRODUCTS_COUNT <- map["CHILDPRODUCTS_COUNT"]
        NAME <- map["NAME"]
        ID <- map["ID"]
        CHILDCATEGORY_COUNT <- map["CHILDCATEGORY_COUNT"]
    }
}
