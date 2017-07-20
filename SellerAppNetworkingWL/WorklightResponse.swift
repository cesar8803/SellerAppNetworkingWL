//
//  WorklightServices.swift
//  WorklightServices
//
//  Created by Luis Cuevas on 19/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class WorklightResponse: Mappable{
    public var L1Categories: L1Categories?
    public var isSuccessful: Int?
    public var facets: [Facets]?
    public var priceRange: PriceRange?
    public var results: [Results]?
    public var obtenerTiposMesaResponse: ObtenerTiposMesaResponse?
    public var consultarParametroResponse: ConsultarParametroResponse?
    public var busquedaEventoResponse: BusquedaEventoResponse?
    public var listaEventoResponse: ListaEventoResponse?
    public var remisionesConsultaOrdenResponse: RemisionesConsultaOrdenResponse?
    public var consultaSku_InventarioResponse: ConsultaSkuInventarioResponse?
    public var getConsultaSKUPoolResponse: GetConsultaSkuPoolResponse?

    public required init?(map: Map){
    }
    public func mapping(map: Map){
        L1Categories <- map["L1Categories"]
        isSuccessful <- map["isSuccessful"]
        facets <- map["facets"]
        priceRange <- map["priceRange"]
        results <- map["results"]
        obtenerTiposMesaResponse <- map["obtenerTiposMesaResponse"]
        consultarParametroResponse <- map["consultarParametroResponse"]
        busquedaEventoResponse <- map["busquedaEventoResponse"]
        listaEventoResponse <- map["listaEventoResponse"]
        remisionesConsultaOrdenResponse <- map["Remisiones_consulta_ordenResponse"]
        consultaSku_InventarioResponse <- map["ConsultaSku_InventarioResponse"]
        getConsultaSKUPoolResponse <- map["getConsultaSKUPoolResponse"]
    }
}
