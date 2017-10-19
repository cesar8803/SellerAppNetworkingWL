//
//  ResponseCreaActualizaOVREM.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Guillermo Cuevas García on 30/09/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class ResponseCreaActualizaOVREM: Mappable{
    public var isSuccessful: Int?
    public var CreaActualizaOVREMResponse: CreaActualizaOVREMResponse?
    
    public required init?( map: Map){
    }
    public func mapping(map: Map){
        isSuccessful <- map["isSuccessful"]
        CreaActualizaOVREMResponse <- map["CreaActualizaOVREMResponse"]
    }
}
