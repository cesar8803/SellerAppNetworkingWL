//
//  CreaActualizaOVREMResponse.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Guillermo Cuevas García on 30/09/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class CreaActualizaOVREMResponse: Mappable{
    public var CodRespuesta: String?
    public var DescRespuesta: String?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        CodRespuesta <- map["CodRespuesta"]
        DescRespuesta <- map["DescRespuesta"]
    }
}
