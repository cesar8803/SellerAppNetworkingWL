//
//  EstimatedDeliveryDateResponse.swift
//  SellerAppNetworkingWL
//
//  Created by Adair on 05/10/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class EstimatedDeliveryDateResponse: Mappable {
    
    public var consultarFechaEstimadaEntregaResponse: ConsultarFechaEstimadaEntregaResponse?
    public var isSuccessful: Int?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        consultarFechaEstimadaEntregaResponse <- map["consultarFechaEstimadaEntregaResponse"]
        isSuccessful <- map["isSuccessful"]
    }
}

public class ConsultarFechaEstimadaEntregaResponse: Mappable{
    public var listaFechaEstimadaEntrega: [ListaFechaEstimadaEntrega]?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        listaFechaEstimadaEntrega <- map["listaFechaEstimadaEntrega"]
    }
}

public class ListaFechaEstimadaEntrega: Mappable{
    public var sku: String?
    public var fechaEstimadaEntrega: String?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        sku <- map["sku"]
        fechaEstimadaEntrega <- map["fechaEstimadaEntrega"]
    }
}
