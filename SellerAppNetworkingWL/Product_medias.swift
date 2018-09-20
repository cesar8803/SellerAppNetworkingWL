//
//  Product_medias.swift
//  SellerAppNetworkingMW
//
//  Created by Emmanuel Casanas Cruz on 19/09/18.
//  Copyright © 2018 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class Product_medias : Mappable {
	public var media_url : String?
	public var mime_type : String?
	public var type : String?

    public required init?(map: Map) {
        
    }

	public func mapping(map: Map) {

		media_url <- map["media_url"]
		mime_type <- map["mime_type"]
		type <- map["type"]
	}

}
