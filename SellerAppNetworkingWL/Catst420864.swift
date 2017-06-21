//
//  Catst420864.swift
//  WorklightTest
//
//  Created by Luis Cuevas on 20/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

class Catst420864: Mappable{
    var CHILDPRODUCTS_COUNT: Float?
    var NAME: String?
    var FIRST_CHILDPRODUCT_IMG: FirstChildProductImg?
    var ID: String?
    var CHILDCATEGORY_COUNT: String?
    
    required init?(map: Map){
    }
    func mapping(map: Map){
        CHILDPRODUCTS_COUNT <- map["CHILDPRODUCTS_COUNT"]
        NAME <- map["NAME"]
        FIRST_CHILDPRODUCT_IMG <- map["FIRST_CHILDPRODUCT_IMG"]
        ID <- map["ID"]
        CHILDCATEGORY_COUNT <- map["CHILDCATEGORY_COUNT"]
    }
}
