//
//  OrderMiraklResponse.swift
//  SellerAppNetworkingMW
//
//  Created by Emmanuel Casanas Cruz on 19/09/18.
//  Copyright © 2018 Liverpool. All rights reserved.
//


import Foundation
import ObjectMapper

public class OrderMiraklResponse : Mappable {
	public var offers_not_shippable : [String]?
	public var orders : [Orders]?

	public required init?(map: Map) {

	}

	public func mapping(map: Map) {

		offers_not_shippable <- map["offers_not_shippable"]
		orders <- map["orders"]
	}

}
