//
//  Qry_inv_resp.swift
//  SellerAppNetworkingWL
//
//  Created by David on 19/09/18.
//  Copyright © 2018 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class Qry_inv_resp : Mappable {
    public var array_obj : [Array_obj]?
    
    public required init?(map: Map){}
    
    public func mapping(map: Map) {
        array_obj <- map["array_obj"]
    }
}
