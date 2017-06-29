//
//  Cat5040494.swift
//  WorklightTest
//
//  Created by Luis Cuevas on 20/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class Cat5040494: Mappable{
    public var NAME: String?
    public var CHILDPRODUCTS_COUNT: String?
    public var L2CategoryInfo: L2CategoryInfo?
    public var RootIndexValue: Float?
    public var ID: String?
    public var CHILDCATEGORY_COUNT: Float?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        NAME <- map["NAME"]
        CHILDPRODUCTS_COUNT <- map["CHILDPRODUCTS_COUNT"]
        L2CategoryInfo <- map["L2CategoryInfo"]
        RootIndexValue <- map["RootIndexValue"]
        ID <- map["ID"]
        CHILDCATEGORY_COUNT <- map["CHILDCATEGORY_COUNT"]
    }
}
