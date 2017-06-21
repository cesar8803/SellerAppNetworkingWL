//
//  Cat1250621.swift
//  WorklightTest
//
//  Created by Luis Cuevas on 20/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

class Cat1250621: Mappable{
    var L2CategoryInfo: L2CategoryInfo?
    var CHILDPRODUCTS_COUNT: String?
    var NAME: String?
    var ID: String?
    var CHILDCATEGORY_COUNT: Float?
    
    required init?(map: Map){
    }
    func mapping(map: Map){
        L2CategoryInfo <- map["L2CategoryInfo"]
        CHILDPRODUCTS_COUNT <- map["CHILDPRODUCTS_COUNT"]
        NAME <- map["NAME"]
        ID <- map["ID"]
        CHILDCATEGORY_COUNT <- map["CHILDCATEGORY_COUNT"]
    }
}
