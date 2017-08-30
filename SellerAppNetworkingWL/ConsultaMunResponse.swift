//
//  ConsultaMunResponse.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Guillermo Cuevas García on 23/08/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class ConsultaMunResponse: Mappable{
    public var Municipio: [Municipio]?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        Municipio <- map["Municipio"]
    }
}
