EstimatedDeliveryDateResponse

//
//  EstimatedDeliveryDateResponse.swift
//  SellerAppNetworkingWL
//
//  Created by Adair on 05/10/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

class EstimatedDeliveryDateResponse: Mappable {
    
    var consultarFechaEstimadaEntregaResponse: ConsultarFechaEstimadaEntregaRequest?
    var isSuccessful: Int?
    
    required init?(map: Map){
    }
    func mapping(map: Map){
        consultarFechaEstimadaEntregaRequest <- map["consultarFechaEstimadaEntregaRequest"]
        isSuccessful <- map["isSuccessful"]
    }
}


class ConsultarFechaEstimadaEntregaRequest: Mappable{
    var listaFechaEstimadaEntrega: [ListaFechaEstimadaEntrega]?
    
    required init?(map: Map){
    }
    func mapping(map: Map){
        listaFechaEstimadaEntrega <- map["listaFechaEstimadaEntrega"]
    }
}

class ListaFechaEstimadaEntrega: Mappable{
    var sku: String?
    var fechaEstimadaEntrega: String?
    
    required init?(map: Map){
    }
    func mapping(map: Map){
        sku <- map["sku"]
        fechaEstimadaEntrega <- map["fechaEstimadaEntrega"]
    }
}
