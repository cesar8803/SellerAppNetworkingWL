//
//  WorklightServices.swift
//  WorklightServices
//
//  Created by Luis Cuevas on 19/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class WorklightResponse: Mappable{
    var L1Categories: L1Categories?
    var isSuccessful: Int?
    var facets: [Facets]?
    var priceRange: PriceRange?
    var results: [Results]?
    var obtenerTiposMesaResponse: ObtenerTiposMesaResponse?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        L1Categories <- map["L1Categories"]
        isSuccessful <- map["isSuccessful"]
        facets <- map["facets"]
        priceRange <- map["priceRange"]
        results <- map["results"]
        obtenerTiposMesaResponse <- map["obtenerTiposMesaResponse"]
    }
}
