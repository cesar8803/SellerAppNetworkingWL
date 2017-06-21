//
//  Catst420865.swift
//  WorklightTest
//
//  Created by Luis Cuevas on 20/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

class Catst420865: Mappable{
    var CHILDPRODUCTS_COUNT: String?
    var NAME: String?
    var ID: String?
    var CHILDCATEGORY_COUNT: Float?
    
    required init?(map: Map){
    }
    func mapping(map: Map){
        CHILDPRODUCTS_COUNT <- map["CHILDPRODUCTS_COUNT"]
        NAME <- map["NAME"]
        ID <- map["ID"]
        CHILDCATEGORY_COUNT <- map["CHILDCATEGORY_COUNT"]
    }
}
