//
//  L2CategoryInfo.swift
//  WorklightTest
//
//  Created by Luis Cuevas on 20/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class L2CategoryInfo: Mappable{
    var catst420840: Catst420840?
    var catst420841: Catst420841?
    var catst420968: Catst420968?
    var catst420839: Catst420839?
    var catst420838: Catst420838?
    var catst425036: Catst425036?
    var catst420837: Catst420837?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        catst420840 <- map["catst420840"]
        catst420841 <- map["catst420841"]
        catst420968 <- map["catst420968"]
        catst420839 <- map["catst420839"]
        catst420838 <- map["catst420838"]
        catst425036 <- map["catst425036"]
        catst420837 <- map["catst420837"]
    }
}
