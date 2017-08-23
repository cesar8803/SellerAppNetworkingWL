//
//  CrearOrdenDevBTResponse.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Guillermo Cuevas García on 23/08/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class CrearOrdenDevBTResponse: Mappable{
    public var ordenDevolucion: String?
    public var ordenEntrega: String?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        ordenDevolucion <- map["OrdenDevolucion"]
        ordenEntrega <- map["OrdenEntrega"]
    }
}
