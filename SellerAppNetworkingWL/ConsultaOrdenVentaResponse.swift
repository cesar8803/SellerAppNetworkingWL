//
//  ConsultaOrdenVentaResponse.swift
//  SellerAppNetworkingWL
//
//  Created by Oscar on 20/07/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class ConsultaOrdenVentaResponse: Mappable{
    public var LineaRemisionSCOL: [LineaRemisionsScol]?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        LineaRemisionSCOL <- map["LineaRemisionSCOL"]
    }
}
