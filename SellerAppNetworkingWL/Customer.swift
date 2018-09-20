//
//  Customer.swift
//  SellerAppNetworkingMW
//
//  Created by Emmanuel Casanas Cruz on 19/09/18.
//  Copyright © 2018 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class Customer : Mappable {
	public var billing_address : Billing_address?
	public var civility : String?
	public var customer_id : String?
	public var email : String?
	public var firstname : String?
	public var lastname : String?
	public var locale : String?
	public var shipping_address : Shipping_address?

	public required init?(map: Map) {

	}

	public func mapping(map: Map) {

		billing_address <- map["billing_address"]
		civility <- map["civility"]
		customer_id <- map["customer_id"]
		email <- map["email"]
		firstname <- map["firstname"]
		lastname <- map["lastname"]
		locale <- map["locale"]
		shipping_address <- map["shipping_address"]
	}

}
