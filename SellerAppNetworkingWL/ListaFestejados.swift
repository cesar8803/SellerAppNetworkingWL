//
//  ListaFestejados.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Cuevas on 29/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class ListaFestejados: Mappable{
    public var nombreCompleto: String?
    public var tipo: Float?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        nombreCompleto <- map["nombreCompleto"]
        tipo <- map["tipo"]
    }
}
