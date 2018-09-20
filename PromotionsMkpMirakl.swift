//
//  PromotionsMkpMirakl.swift
//  SellerAppNetworkingMW
//
//  Created by Emmanuel Casanas Cruz on 19/09/18.
//  Copyright © 2018 Liverpool. All rights reserved.
//


import Foundation
import ObjectMapper

public class PromotionsMkpMirakl : Mappable {
	public var applied_promotions : [String]?
	public var total_deduced_amount : Int?

    public required init?(map: Map) {
        
    }

	public func mapping(map: Map) {

		applied_promotions <- map["applied_promotions"]
		total_deduced_amount <- map["total_deduced_amount"]
	}

}
