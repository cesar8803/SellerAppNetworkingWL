//
//  ConsultarParametroResponse.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Cuevas on 29/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

class ConsultarParametroResponse: Mappable{
    var valor: String?
    
    required init?(map: Map){
    }
    func mapping(map: Map){
        valor <- map["valor"]
    }
}
