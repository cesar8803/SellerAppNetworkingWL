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
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        tienda <- map["tienda"]
        id <- map["id"]
        direccion <- map["direccion"]
    }
}
