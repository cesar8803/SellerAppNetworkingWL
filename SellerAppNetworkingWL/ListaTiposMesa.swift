//
//  ListaTiposMesa.swift
//  WorklightServices
//
//  Created by Luis Cuevas on 19/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class ListaTiposMesa: Mappable{
    public var descripcion: String?
    public var id: Int?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        descripcion <- map["descripcion"]
        id <- map["id"]
    }
}
