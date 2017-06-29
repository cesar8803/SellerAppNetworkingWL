//
//  PriceRange.swift
//  WorklightServices
//
//  Created by Luis Cuevas on 19/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class PriceRange: Mappable{
    public var minimum: Float?
    public var maximum: Float?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        minimum <- map["minimum"]
        maximum <- map["maximum"]
    }
}
