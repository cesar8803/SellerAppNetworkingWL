//
//  ListaTiendas.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Guillermo Cuevas García on 01/09/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class ListaTiendas: Mappable{
    public var tienda: String?
    public var id: String?
    public var direccion: String?
    public var idEstado: String?
    public var idAsentamiento: String?
    public var idDelegacionMunicipio: String?
    public var idCalle: String?
    
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        tienda <- map["tienda"]
        id <- map["id"]
        direccion <- map["direccion"]
        idEstado <- map["idEstado"]
        idAsentamiento <- map["idAsentamiento"]
        idDelegacionMunicipio <- map["idDelegacionMunicipio"]
        idCalle <- map["idCalle"]
    }
}
