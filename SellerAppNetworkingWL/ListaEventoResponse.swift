//
//  ListaEventoResponse.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Cuevas on 29/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

class ListaEventoResponse: Mappable{
    var tienda: String?
    var listaDirecciones: [ListaDirecciones]?
    var fechaEvento: String?
    var listaFestejados: [ListaFestejados]?
    var listaArticulos: [ListaArticulos]?
    var tipoMesa: Float?
    var comentarios: String?
    var numEvento: String?
    
    required init?(map: Map){
    }
    func mapping(map: Map){
        tienda <- map["tienda"]
        listaDirecciones <- map["listaDirecciones"]
        fechaEvento <- map["fechaEvento"]
        listaFestejados <- map["listaFestejados"]
        listaArticulos <- map["listaArticulos"]
        tipoMesa <- map["tipoMesa"]
        comentarios <- map["comentarios"]
        numEvento <- map["numEvento"]
    }
}
