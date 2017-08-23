//
//  Asentamiento.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Guillermo Cuevas García on 23/08/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class Asentamiento: Mappable{
    public var descripcion: String?
    public var cp: String?
    public var id_asen: String?
    public var cve_larga_dist: String?
    public var tipo: String?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        descripcion <- map["descripcion"]
        cp <- map["cp"]
        id_asen <- map["id_asen"]
        cve_larga_dist <- map["cve_larga_dist"]
        tipo <- map["tipo"]
    }
}
