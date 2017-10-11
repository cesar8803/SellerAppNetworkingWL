//
//  ActualizarOBS_FechaEntregaBTResponse.swift
//  SellerAppNetworkingWL
//
//  Created by Alejandro Hernandez on 10/10/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class ActualizarOBS_FechaEntregaBTResponse: Mappable{
    
    public var estadoSKU: String?
    public var fechaEntrega: String?
    
    public required init?(map: Map) {
    }
    
    public func mapping(map: Map) {
        estadoSKU <- map["estadoSKU"]
        fechaEntrega <- map["fechaEntrega"]
    }
    
}

