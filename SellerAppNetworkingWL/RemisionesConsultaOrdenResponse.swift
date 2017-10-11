//
//  RemisionesConsultaOrdenResponse.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Guillermo Cuevas García on 12/07/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class RemisionesConsultaOrdenResponse: Mappable{
    public var fechaEmision: String?
    public var estadoOrden: String?
    public var periodicidad: String?
    public var descEstado: String?
    public var nombreDestinatario: String?
    public var direccionDestinatario: DireccionDestinatario?
    public var listaArticulos: [ListaArticulos]?
    public var diasEntrega: String?
    public var observaciones: String?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        fechaEmision <- map["fechaEmision"]
        estadoOrden <- map["estadoOrden"]
        periodicidad <- map["periodicidad"]
        descEstado <- map["descEstado"]
        nombreDestinatario <- map["nombreDestinatario"]
        direccionDestinatario <- map["direccionDestinatario"]
        listaArticulos <- map["listaArticulos"]
        diasEntrega <- map["diasEntrega"]
        observaciones <- map["observaciones"]
    }
}
