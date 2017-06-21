//
//  Facets.swift
//  WorklightServices
//
//  Created by Luis Cuevas on 19/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

class Facets: Mappable{
    var id: String?
    var label: String?
    
    required init?(map: Map){
    }
    func mapping(map: Map){
        id <- map["id"]
        label <- map["label"]
    }
}
