//
//  ListaEventoResponse.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Cuevas on 29/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class ListaEventoResponse: Mappable{
    public var tienda: String?
    public var listaDirecciones: [ListaDirecciones]?
    public var fechaEvento: String?
    public var listaFestejados: [ListaFestejados]?
    public var listaArticulos: [ListaArticulos]?
    public var tipoMesa: Float?
    public var comentarios: String?
    public var numEvento: String?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
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
