//
//  ConsultarEstadosTiendasCCResponse.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Guillermo Cuevas García on 01/09/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class ConsultarEstadosTiendasCCResponse: Mappable{
    public var listaEstados: [ListaEstados]?
    public var listaTiendas: [ListaTiendas]?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        listaEstados <- map["listaEstados"]
        listaTiendas <- map["listaTiendas"]
    }
}
