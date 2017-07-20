//
//  GetConsultaSkuPoolResponse.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Guillermo Cuevas García on 20/07/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class GetConsultaSkuPoolResponse: Mappable{
    public var getConsultaSKUPoolRecord: [GetConsultaSkuPoolRecord]?
    public var getConsultaSKUPoolHeader: GetConsultaSkuPoolHeader?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        getConsultaSKUPoolRecord <- map["getConsultaSKUPoolRecord"]
        getConsultaSKUPoolHeader <- map["getConsultaSKUPoolHeader"]
    }
}
