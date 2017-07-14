//
//  ConsultaskuInventarioResponse.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Guillermo Cuevas García on 14/07/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class ConsultaSkuInventarioResponse: Mappable{
    public var sap_inventario: SapInventario?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        sap_inventario <- map["Sap_inventario"]
    }
}
