//
//  ListaArticulos.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Cuevas on 29/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

class ListaArticulos: Mappable{
    var SKU: String?
    var nombre: String?
    var url: String?
    var cantidad: Float?
    var clasificacion: String?
    
    required init?(map: Map){
    }
    func mapping(map: Map){
        SKU <- map["SKU"]
        nombre <- map["nombre"]
        url <- map["url"]
        cantidad <- map["cantidad"]
        clasificacion <- map["clasificacion"]
    }
}
