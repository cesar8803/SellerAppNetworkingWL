//
//  SaldosResponse.swift
//  SellerAppNetworkingWL
//
//  Created by Bernardino Guerrero Ibarra on 10/5/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class SaldosResponse:Mappable{
    public var svc:String?
    public var suc:String?
    public var pm_sinrefin:String?
    public var sv:String?
    public var nt:String?
    public var flp:String?
    public var sa:String?
    public var Txs:String?
    public var nc:String?
    public var pm_conrefin:String?
    public var pmni:String?
    public var tipoCuenta:String?
    public var pm:String?
    
    public required init?(map: Map){
    }
    
    public func mapping(map: Map){
        svc <- map["svc"]
        suc <- map["suc"]
        pm_sinrefin <- map["pm_sinrefin"]
        sv <- map["sv"]
        nt <- map["nt"]
        flp <- map["flp"]
        sa <- map["sa"]
        Txs <- map["Txs"]
        nc <- map["nc"]
        pm_conrefin <- map["pm_conrefin"]
        pmni <- map["pmni"]
        tipoCuenta <- map["tipoCuenta"]
        pm <- map["pm"]
    }

}
