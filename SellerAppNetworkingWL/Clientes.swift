//
//  Clientes.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Guillermo Cuevas García on 28/08/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class Clientes: Mappable{
    public var datosSOMS: DatosSoms?
    
    public var fechaActualizacion: String?
    public var image: String?
    public var nombre_cliente: String?
    public var id: String?
    public var email: String?
    public var fecha: String?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        datosSOMS <- map["DatosSOMS"]
        fechaActualizacion <- map["fechaActualizacion"]
        image <- map["image"]
        nombre_cliente <- map["nombre_cliente"]
        id <- map["id"]
        email <- map["email"]
        fecha <- map["fecha"]
    }
}
