//
//  ConsultarFechaEntrega.swift
//  SellerAppNetworkingWL
//
//  Created by David on 19/09/18.
//  Copyright © 2018 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class ConsultarFechaEntrega : Mappable {
    public var xmlns : String?
    public var qry_inv_resp : Qry_inv_resp?
    
    public required init?(map: Map){}
    
    public func mapping(map: Map) {
        xmlns <- map["xmlns"]
        qry_inv_resp <- map["qry_inv_resp"]
    }
    
}

