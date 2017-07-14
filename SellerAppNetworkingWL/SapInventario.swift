//
//  SapInventario.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Guillermo Cuevas García on 14/07/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class SapInventario: Mappable{
    public var sap_sku_inventario: [SapSkuInventario]?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        sap_sku_inventario <- map["Sap_sku_inventario"]
    }
}
