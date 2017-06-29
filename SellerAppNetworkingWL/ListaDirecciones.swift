//
//  ListaDirecciones.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Cuevas on 29/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

class ListaDirecciones: Mappable{
    var poblacion: String?
    var telefono1: String?
    var telefono2: String?
    var tipoFestejado: Float?
    var numExt: String?
    var calle: String?
    var colonia: String?
    var edificio: String?
    var codPos: String?
    var pais: String?
    var estado: String?
    var municipio: String?
    
    required init?(map: Map){
    }
    func mapping(map: Map){
        poblacion <- map["poblacion"]
        telefono1 <- map["telefono1"]
        telefono2 <- map["telefono2"]
        tipoFestejado <- map["tipoFestejado"]
        numExt <- map["numExt"]
        calle <- map["calle"]
        colonia <- map["colonia"]
        edificio <- map["edificio"]
        codPos <- map["codPos"]
        pais <- map["pais"]
        estado <- map["estado"]
        municipio <- map["municipio"]
    }
}
