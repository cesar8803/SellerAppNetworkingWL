//
//  SapSkuInventario.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Guillermo Cuevas García on 14/07/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class SapSkuInventario: Mappable{
    public var disp: String?
    public var sku: String?
    public var piso: String?
    public var intransfer: String?
    public var pdis: String?
    public var locacion: String?
    public var inprocess: String?
    public var onorder: String?
    public var envi: String?
    public var intransit: String?
    public var bode: String?
    public var apar: String?
    public var storeName: String?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        disp <- map["Disp"]
        sku <- map["Sku"]
        piso <- map["Piso"]
        intransfer <- map["Intransfer"]
        pdis <- map["Pdis"]
        locacion <- map["Locacion"]
        inprocess <- map["Inprocess"]
        onorder <- map["Onorder"]
        envi <- map["Envi"]
        intransit <- map["Intransit"]
        bode <- map["Bode"]
        apar <- map["Apar"]
    }
}
