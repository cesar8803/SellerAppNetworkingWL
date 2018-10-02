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
    // PARCH SERVICIO MKP MAL feo caca
    public var outIdDireccion: String?
    public var outIdCliente: String?
    public var outErrorMessage: String?
    public var outErrorCode: String?
    public var outCteTelefono: String?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        setAltaClienteRecord <- map["setAltaClienteRecord"]
        outIdDireccion <- map["outIdDireccion"]
        outIdCliente <- map["outIdCliente"]
        outErrorMessage <- map["outErrorMessage"]
        outErrorCode <- map["outErrorCode"]
        outCteTelefono <- map["outCteTelefono"]
    }
}

