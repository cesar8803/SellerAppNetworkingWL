//
//  AltaClienteDireccionResponse.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Guillermo Cuevas García on 29/08/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class AltaClienteDireccionResponse: Mappable{
    public var setAltaClienteRecord: SetAltaClienteRecord?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        setAltaClienteRecord <- map["setAltaClienteRecord"]
    }
}
