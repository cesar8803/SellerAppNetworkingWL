//
//  ConsultaEMAResponse.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Guillermo Cuevas García on 26/09/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class ConsultaEMAResponse: Mappable{
    public var EMA: [Ema]?
    
    public required init?( map: Map){
    }
    public func mapping(map: Map){
        EMA <- map["EMA"]
    }
}
