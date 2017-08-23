//
//  Municipio.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Guillermo Cuevas García on 23/08/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class Municipio: Mappable{
    public var descripcion: String?
    public var id_mun: String?
    public var id_edo: String?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        descripcion <- map["descripcion"]
        id_mun <- map["id_mun"]
        id_edo <- map["id_edo"]
    }
}
