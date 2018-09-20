//
//  Commission_taxes.swift
//  SellerAppNetworkingMW
//
//  Created by Emmanuel Casanas Cruz on 19/09/18.
//  Copyright © 2018 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class Commission_taxes : Mappable {
	public var amount : Double?
	public var code : String?
	public var rate : Double?

	public required init?(map: Map) {

	}

	public  func mapping(map: Map) {
		amount <- map["amount"]
		code <- map["code"]
		rate <- map["rate"]
	}

}
