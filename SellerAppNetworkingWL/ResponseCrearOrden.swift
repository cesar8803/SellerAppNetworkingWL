//
//  ResponseCrearOrden.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Guillermo Cuevas García on 30/09/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class ResponseCrearOrden: Mappable{
    public var outStatus: String?
    public var isSuccessful: Int?
    public var outMessage: String?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        outStatus <- map["outStatus"]
        isSuccessful <- map["isSuccessful"]
        outMessage <- map["outMessage"]
    }
}
