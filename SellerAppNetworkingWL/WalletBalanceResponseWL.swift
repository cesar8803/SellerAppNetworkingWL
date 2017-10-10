//
//  WalletBalanceResponse.swift
//  SellerAppNetworkingWL
//
//  Created by Bernardino Guerrero Ibarra on 10/9/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class WalletBalanceResponseWL:Mappable{
    public var nc:String?
    public var sa:String?
    
    public required init?(map: Map){
    }
    
    public func mapping(map: Map){
        nc <- map["nc"]
        sa <- map["sa"]
    }
        
}
