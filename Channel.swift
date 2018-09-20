//
//  Channel.swift
//  SellerAppNetworkingMW
//
//  Created by Emmanuel Casanas Cruz on 19/09/18.
//  Copyright © 2018 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class Channel : Mappable {
	public var code : String?
	public var label : String?

	public required init?(map: Map) {

	}

	public func  mapping(map: Map) {
		code <- map["code"]
		label <- map["label"]
	}

}
