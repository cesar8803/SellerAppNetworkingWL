//
//  ListaFestejados.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Cuevas on 29/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

class ListaFestejados: Mappable{
    var nombreCompleto: String?
    var tipo: Float?
    
    required init?(map: Map){
    }
    func mapping(map: Map){
        nombreCompleto <- map["nombreCompleto"]
        tipo <- map["tipo"]
    }
}
