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
    public var sendEmail: String?
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
    public var ConsultaOrdenVentaResponse: ConsultaOrdenVentaResponse?
    public var exitoso: Int?
    public var resultado: String?
    public var errors: [Errors]?
    public var crearOrdenDevBTResponse: CrearOrdenDevBTResponse?
    public var consultaEdoResponse: ConsultaEdoResponse?
    public var consultaMunResponse: ConsultaMunResponse?
    public var consultaAsentResponse: ConsultaAsentResponse?
    public var consultaCalleCPResponse: ConsultaCalleCPResponse?

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
        ConsultaOrdenVentaResponse <- map["ConsultaOrdenVentaResponse"]
        sendEmail <- map["sendEmail"]
        exitoso <- map["exitoso"]
        resultado <- map["resultado"]
        errors <- map["errors"]
        crearOrdenDevBTResponse <- map["CrearOrdenDevBTResponse"]
        consultaEdoResponse <- map["ConsultaEdoResponse"]
        consultaMunResponse <- map["ConsultaMunResponse"]
        consultaAsentResponse <- map["ConsultaAsentResponse"]
        consultaCalleCPResponse <- map["ConsultaCalleCPResponse"]
    }
}
