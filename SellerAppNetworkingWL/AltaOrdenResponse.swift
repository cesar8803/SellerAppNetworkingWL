//
//  AltaOrdenResponse.swift
//  SellerAppNetworkingWL
//
//  Created by Alejandro Hernandez on 30/09/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class AltaOrdenResponse: Mappable{
    public var setAltaOrdenRecord: [SetAltaOrdenRecord]?
    public var order: String?
    public var invalidsSKUs: [String]?
    
    public required init?(map: Map){
    }
    
    public func mapping(map: Map){
        setAltaOrdenRecord <- map["setAltaOrdenRecord"]
    }
}
