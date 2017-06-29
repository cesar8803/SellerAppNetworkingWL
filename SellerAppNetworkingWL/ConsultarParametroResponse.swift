//
//  ConsultarParametroResponse.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Cuevas on 29/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class ConsultarParametroResponse: Mappable{
    public var valor: String?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        valor <- map["valor"]
    }
}
