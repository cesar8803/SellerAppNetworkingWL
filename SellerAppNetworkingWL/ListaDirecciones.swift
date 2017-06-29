//
//  ListaDirecciones.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Cuevas on 29/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class ListaDirecciones: Mappable{
    public var poblacion: String?
    public var telefono1: String?
    public var telefono2: String?
    public var tipoFestejado: Float?
    public var numExt: String?
    public var calle: String?
    public var colonia: String?
    public var edificio: String?
    public var codPos: String?
    public var pais: String?
    public var estado: String?
    public var municipio: String?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
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
