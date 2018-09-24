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
    public var array_obj_Array : [Array_obj]?
    public var array_obj_Dic : Array_obj?
    
    public required init?(map: Map){}
    
    public func mapping(map: Map) {
        //        array_obj <- map["array_obj"]
        
        switch map["array_obj"].currentValue {
        case (let v as [Any]):
            debugPrint("Se obtuvo Array \(v)")
            array_obj_Array <- map["array_obj"]
        case  (let v as [String: Any]):
            debugPrint("Se obtuvo Dicionario \(v)")
            array_obj_Dic <- map["array_obj"]
        default:
            debugPrint("Respueta furera de rango")
        }
    }
}
