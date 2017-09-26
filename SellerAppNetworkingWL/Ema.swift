//
//  Ema.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Guillermo Cuevas García on 26/09/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class Ema: Mappable{
    public var tipo_asen: String?
    public var descripcion_edo: String?
    public var id_asen: String?
    public var id_edo: String?
    public var descripcion_asen: String?
    public var id_mun: String?
    public var descripcion_mun: String?
    public var cp: String?
    public var cve_larga_dist: String?
    
    public required init?( map: Map){
    }
    public func mapping(map: Map){
        tipo_asen <- map["tipo_asen"]
        descripcion_edo <- map["descripcion_edo"]
        id_asen <- map["id_asen"]
        id_edo <- map["id_edo"]
        descripcion_asen <- map["descripcion_asen"]
        id_mun <- map["id_mun"]
        descripcion_mun <- map["descripcion_mun"]
        cp <- map["cp"]
        cve_larga_dist <- map["cve_larga_dist"]
    }
}
