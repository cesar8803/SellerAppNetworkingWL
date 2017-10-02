//
//  SetAltaOrdenRecord.swift
//  SellerAppNetworkingWL
//
//  Created by Alejandro Hernandez on 30/09/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class SetAltaOrdenRecord: Mappable{
    public var outEdo: String?
    public var outRegistro: String?
    public var outCantidad: String?
    public var outFechaEntrega: String?
    public var outOrdenEntrega: String?
    public var outEdoOrden: String?
    public var outCantidadNoSpot: String?
    public var outDescripcion: String?
    public var outSKU: String?
    public var outErrorCode: String?
    public var outSKUNoSpot: String?
    public var outErrorMessage: String?
    
    public required init?(map: Map){
    }
    
    public func mapping(map: Map){
        outEdo <- map["outEdo"]
        outRegistro <- map["outRegistro"]
        outCantidad <- map["outCantidad"]
        outFechaEntrega <- map["outFechaEntrega"]
        outOrdenEntrega <- map["outOrdenEntrega"]
        outEdoOrden <- map["outEdoOrden"]
        outCantidadNoSpot <- map["outCantidadNoSpot"]
        outDescripcion <- map["outDescripcion"]
        outSKU <- map["outSKU"]
        outErrorCode <- map["outErrorCode"]
        outSKUNoSpot <- map["outSKUNoSpot"]
        outErrorMessage <- map["outErrorMessage"]
    }
}
