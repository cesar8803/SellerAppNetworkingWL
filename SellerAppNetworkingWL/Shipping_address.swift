//
//  Shipping_address.swift
//  SellerAppNetworkingMW
//
//  Created by Emmanuel Casanas Cruz on 19/09/18.
//  Copyright © 2018 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class Shipping_address : Mappable {
	public var additional_info : String?
	public var city : String?
	public var company : String?
	public var country : String?
	public var country_iso_code : String?
	public var firstname : String?
	public var internal_additional_info : String?
	public var lastname : String?
	public var phone : String?
	public var state : String?
	public var street_1 : String?
	public var street_2 : String?
	public var zip_code : String?

    public required init?(map: Map) {
        
    }

	public func mapping(map: Map) {

		additional_info <- map["additional_info"]
		city <- map["city"]
		company <- map["company"]
		country <- map["country"]
		country_iso_code <- map["country_iso_code"]
		firstname <- map["firstname"]
		internal_additional_info <- map["internal_additional_info"]
		lastname <- map["lastname"]
		phone <- map["phone"]
		state <- map["state"]
		street_1 <- map["street_1"]
		street_2 <- map["street_2"]
		zip_code <- map["zip_code"]
	}

}
