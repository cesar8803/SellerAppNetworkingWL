//
//  ListaEventos.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Cuevas on 29/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

class ListaEventos: Mappable{
    var numeroEvento: String?
    var listaFestejados: [String]?
    var fechaEvento: String?
    
    required init?(map: Map){
    }
    func mapping(map: Map){
        numeroEvento <- map["numeroEvento"]
        listaFestejados <- map["listaFestejados"]
        fechaEvento <- map["fechaEvento"]
    }
}
