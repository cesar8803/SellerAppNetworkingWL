//
//  ConsultaCalleCPResponse.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Guillermo Cuevas García on 23/08/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class ConsultaCalleCPResponse: Mappable{
    public var calle: [Calle]?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        calle <- map["Calle"]
    }
}
