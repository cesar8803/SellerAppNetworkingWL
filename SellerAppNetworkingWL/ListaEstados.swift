//
//  ListaEstados.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Guillermo Cuevas García on 01/09/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class ListaEstados: Mappable{
    public var nombreEstado: String?
    public var idEstado: String?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        nombreEstado <- map["nombreEstado"]
        idEstado <- map["idEstado"]
    }
}
