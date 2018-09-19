//
//  ResponseConsultarFechaEntrega.swift
//  SellerAppNetworkingWL
//
//  Created by David on 19/09/18.
//  Copyright © 2018 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class ResponseConsultarFechaEntrega : Mappable {
    public var isSuccessful : Bool?
    public var errors : [Errors]?
    public var consultarFechaEntrega : ConsultarFechaEntrega?
    
    public required init?(map: Map) {}
    
    public func mapping(map: Map) {
        isSuccessful <- map["isSuccessful"]
        errors <- map["errors"]
        consultarFechaEntrega <- map["consultarFechaEntrega"]
    }
}

public struct eddObj {
    public var skuid: String
    public var producttype: String
    public var qty: String
    public var zipcode: String
}

