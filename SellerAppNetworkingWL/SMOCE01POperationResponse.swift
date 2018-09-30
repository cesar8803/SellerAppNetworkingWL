//
 //  Qry_inv_resp.swift
 //  SellerAppNetworkingWL
 //
 //  Created by David on 19/09/18.
 //  Copyright © 2018 Deloitte. All rights reserved.
 //


import Foundation
import ObjectMapper

public class SMOCE01POperationResponse : Mappable {
	public var message_response : Message_response?

	public required init?(map: Map) { }

	public func mapping(map: Map) {
		message_response <- map["message_response"]
	}
}
