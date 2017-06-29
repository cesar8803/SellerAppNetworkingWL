//
//  Catst420853.swift
//  WorklightTest
//
//  Created by Luis Cuevas on 20/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class Catst420853: Mappable{
    public var CHILDPRODUCTS_COUNT: String?
    public var NAME: String?
    public var ID: String?
    public var CHILDCATEGORY_COUNT: Float?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        CHILDPRODUCTS_COUNT <- map["CHILDPRODUCTS_COUNT"]
        NAME <- map["NAME"]
        ID <- map["ID"]
        CHILDCATEGORY_COUNT <- map["CHILDCATEGORY_COUNT"]
    }
}
