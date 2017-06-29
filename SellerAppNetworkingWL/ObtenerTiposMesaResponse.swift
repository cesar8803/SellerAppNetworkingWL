//
//  ObtenerTiposMesaResponse.swift
//  WorklightServices
//
//  Created by Luis Cuevas on 19/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class ObtenerTiposMesaResponse: Mappable{
    public var listaTiposMesa: [ListaTiposMesa]?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        listaTiposMesa <- map["listaTiposMesa"]
    }
}
