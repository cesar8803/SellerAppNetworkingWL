//
//  DireccionDestinatario.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Guillermo Cuevas García on 12/07/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class DireccionDestinatario: Mappable{
    public var entre: String?
    public var colonia: String?
    public var telefono: String?
    public var direccion: String?
    public var y: String?
    public var estado: String?
    public var municipio: String?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        entre <- map["entre"]
        colonia <- map["colonia"]
        telefono <- map["telefono"]
        direccion <- map["direccion"]
        y <- map["y"]
        estado <- map["estado"]
        municipio <- map["municipio"]
    }
}
