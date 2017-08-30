//
//  SetAltaClienteRecord.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Guillermo Cuevas García on 29/08/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class SetAltaClienteRecord: Mappable{
    public var outIdDireccion: String?
    public var outIdCliente: String?
    public var outErrorMessage: String?
    public var outErrorCode: String?
    public var outCteTelefono: String?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        outIdDireccion <- map["outIdDireccion"]
        outIdCliente <- map["outIdCliente"]
        outErrorMessage <- map["outErrorMessage"]
        outErrorCode <- map["outErrorCode"]
        outCteTelefono <- map["outCteTelefono"]
    }
}
