//
//  Errors.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Guillermo Cuevas García on 02/08/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class Errors: Mappable{
    public var codError: String?
    public var descError: String?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        codError <- map["codError"]
        descError <- map["descError"]

    }
}
