//
//  ListaArticulos.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Cuevas on 29/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class ListaArticulos: Mappable{
    public var SKU: String?
    public var nombre: String?
    public var url: String?
    public var cantidad: Float?
    public var clasificacion: String?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        SKU <- map["SKU"]
        nombre <- map["nombre"]
        url <- map["url"]
        cantidad <- map["cantidad"]
        clasificacion <- map["clasificacion"]
    }
}
