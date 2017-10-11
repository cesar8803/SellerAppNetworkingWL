//
//  Respuesta.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Guillermo Cuevas García on 28/08/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class Respuesta: Mappable{
    public var codRespuesta: String?
    public var descRespuesta: String?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        codRespuesta <- map["CodRespuesta"]
        descRespuesta <- map["DescRespuesta"]
    }
}
