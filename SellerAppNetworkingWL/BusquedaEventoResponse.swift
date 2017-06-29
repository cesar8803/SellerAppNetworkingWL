//
//  BusquedaEventoResponse.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Cuevas on 29/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

class BusquedaEventoResponse: Mappable{
    var listaEventos: [ListaEventos]?
    
    required init?(map: Map){
    }
    func mapping(map: Map){
        listaEventos <- map["listaEventos"]
    }
}
