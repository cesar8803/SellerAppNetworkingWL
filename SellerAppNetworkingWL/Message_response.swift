//
//  Qry_inv_resp.swift
//  SellerAppNetworkingWL
//
//  Created by David on 19/09/18.
//  Copyright © 2018 Deloitte. All rights reserved.
//


import Foundation
import ObjectMapper

public class Message_response : Mappable {
	public var groupId : String?
	public var returncode : Double?

	public required init?(map: Map) { }

	public func mapping(map: Map) {
		groupId <- map["groupId"]
		returncode <- map["returncode"]
	}
}
