//
//  FirstChildProductImg.swift
//  WorklightTest
//
//  Created by Luis Cuevas on 20/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class FirstChildProductImg: Mappable{
    public var largeImage: String?
    public var smallImage: String?
    public var thumbnailImage: String?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        largeImage <- map["largeImage"]
        smallImage <- map["smallImage"]
        thumbnailImage <- map["thumbnailImage"]
    }
}
