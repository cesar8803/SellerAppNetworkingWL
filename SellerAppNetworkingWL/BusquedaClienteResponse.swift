//
//  BusquedaClienteResponse.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Guillermo Cuevas García on 28/08/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class BusquedaClienteResponse: Mappable{
    public var clientes: [Clientes]?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        clientes <- map["Clientes"]
    }
}
