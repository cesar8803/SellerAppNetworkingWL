//
//  LineaRemisionSCOL.swift
//  SellerAppNetworkingWL
//
//  Created by Oscar on 20/07/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class LineaRemisionsScol: Mappable{
    public var SKU: String?
    public var itinerarioPlan: String?
    public var llegada: String?
    public var llamadaAlCliente: String?
    public var almacen: String?
    public var notasEntrega: String?
    public var esperaDesde: String?
    public var cargadaEnSistema: String?
    public var fotografiaEntrega: String?
    public var retirada: String?
    public var fechaSalida: String?
    public var operador: String?
    public var ruta: String?
    public var status: String?
    public var intentos: String?
    public var esperaHasta: String?
    public var tipoDoc: String?
    public var observaciones: String?
    public var acuseRecibo: String?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        SKU <- map["SKU"]
        itinerarioPlan <- map["itinerarioPlan"]
        llegada <- map["llegada"]
        llamadaAlCliente <- map["llamadaAlCliente"]
        almacen <- map["almacen"]
        notasEntrega <- map["notasEntrega"]
        esperaDesde <- map["esperaDesde"]
        cargadaEnSistema <- map["cargadaEnSistema"]
        fotografiaEntrega <- map["fotografiaEntrega"]
        retirada <- map["retirada"]
        fechaSalida <- map["fechaSalida"]
        operador <- map["operador"]
        ruta <- map["ruta"]
        status <- map["status"]
        intentos <- map["intentos"]
        esperaHasta <- map["esperaHasta"]
        tipoDoc <- map["tipoDoc"]
        observaciones <- map["observaciones"]
        acuseRecibo <- map["acuseRecibo"]
    }
}
