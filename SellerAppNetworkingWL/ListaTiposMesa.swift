//
//  ListaTiposMesa.swift
//  WorklightServices
//
//  Created by Luis Cuevas on 19/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

class ListaTiposMesa: Mappable{
    var descripcion: String?
    var id: Int?
    
    required init?(map: Map){
    }
    func mapping(map: Map){
        descripcion <- map["descripcion"]
        id <- map["id"]
    }
}
