//
//  GetConsultaSkuPoolHeader.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Guillermo Cuevas García on 20/07/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class GetConsultaSkuPoolHeader: Mappable{
    public var outRepeticiones: String?
    public var outTipo: String?
    public var outCantMaxTda: String?
    public var outBuenaCond: String?
    public var outTransfers: String?
    public var outMultiploEmpaque: String?
    public var outEstado: String?
    public var outRecogido: String?
    public var outCongelada: String?
    public var outFila: String?
    public var outMaltratada: String?
    public var outLocEntrega: String?
    public var outErrorMessage: String?
    public var outDisponible: String?
    public var outPendEntreg: String?
    public var outSeccion: String?
    public var outColorSKU: String?
    public var outBodegaQueSurte: String?
    public var outVolumen: String?
    public var outServicio: String?
    public var outTransferencia: String?
    public var outDescripcionSKU: String?
    public var outTipoMercancia: String?
    public var outSet: String?
    public var outTipoCondicion1: String?
    public var outTipoCondicion3: String?
    public var outTipoCondicion2: String?
    public var outVentas: String?
    public var outCondicion: String?
    public var outAncho: String?
    public var outProveedor: String?
    public var outModelo: String?
    public var outUnidadMedida: String?
    public var outTipoSKU: String?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        outRepeticiones <- map["outRepeticiones"]
        outTipo <- map["outTipo"]
        outCantMaxTda <- map["outCantMaxTda"]
        outBuenaCond <- map["outBuenaCond"]
        outTransfers <- map["outTransfers"]
        outMultiploEmpaque <- map["outMultiploEmpaque"]
        outEstado <- map["outEstado"]
        outRecogido <- map["outRecogido"]
        outCongelada <- map["outCongelada"]
        outFila <- map["outFila"]
        outMaltratada <- map["outMaltratada"]
        outLocEntrega <- map["outLocEntrega"]
        outErrorMessage <- map["outErrorMessage"]
        outDisponible <- map["outDisponible"]
        outPendEntreg <- map["outPendEntreg"]
        outSeccion <- map["outSeccion"]
        outColorSKU <- map["outColorSKU"]
        outBodegaQueSurte <- map["outBodegaQueSurte"]
        outVolumen <- map["outVolumen"]
        outServicio <- map["outServicio"]
        outTransferencia <- map["outTransferencia"]
        outDescripcionSKU <- map["outDescripcionSKU"]
        outTipoMercancia <- map["outTipoMercancia"]
        outSet <- map["outSet"]
        outTipoCondicion1 <- map["outTipoCondicion1"]
        outTipoCondicion3 <- map["outTipoCondicion3"]
        outTipoCondicion2 <- map["outTipoCondicion2"]
        outVentas <- map["outVentas"]
        outCondicion <- map["outCondicion"]
        outAncho <- map["outAncho"]
        outProveedor <- map["outProveedor"]
        outModelo <- map["outModelo"]
        outUnidadMedida <- map["outUnidadMedida"]
        outTipoSKU <- map["outTipoSKU"]
    }
}
