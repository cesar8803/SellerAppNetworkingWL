//
//  PriceRange.swift
//  WorklightServices
//
//  Created by Luis Cuevas on 19/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

class PriceRange: Mappable{
    var minimum: Float?
    var maximum: Float?
    
    required init?(map: Map){
    }
    func mapping(map: Map){
        minimum <- map["minimum"]
        maximum <- map["maximum"]
    }
}
