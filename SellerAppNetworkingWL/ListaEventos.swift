//
//  ListaEventos.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Cuevas on 29/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class ListaEventos: Mappable{
    public var numeroEvento: String?
    public var listaFestejados: [String]?
    public var fechaEvento: String?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        numeroEvento <- map["numeroEvento"]
        listaFestejados <- map["listaFestejados"]
        fechaEvento <- map["fechaEvento"]
    }
}
