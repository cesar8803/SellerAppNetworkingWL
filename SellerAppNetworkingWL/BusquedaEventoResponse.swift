//
//  BusquedaEventoResponse.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Cuevas on 29/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class BusquedaEventoResponse: Mappable{
    public var listaEventos: [ListaEventos]?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        listaEventos <- map["listaEventos"]
    }
}
