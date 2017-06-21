//
//  ObtenerTiposMesaResponse.swift
//  WorklightServices
//
//  Created by Luis Cuevas on 19/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

class ObtenerTiposMesaResponse: Mappable{
    var listaTiposMesa: [ListaTiposMesa]?
    
    required init?(map: Map){
    }
    func mapping(map: Map){
        listaTiposMesa <- map["listaTiposMesa"]
    }
}
