//
//  Orders.swift
//  SellerAppNetworkingMW
//
//  Created by Emmanuel Casanas Cruz on 19/09/18.
//  Copyright © 2018 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class Orders : Mappable {
	public var acceptance_decision_date : String?
	public var can_cancel : Bool?
	public var can_evaluate : Bool?
	public var channel : Channel?
	public var commercial_id : String?
	public var created_date : String?
	public var currency_iso_code : String?
	public var customer : Customer?
	public var customer_debited_date : String?
	public var has_customer_message : Bool?
	public var has_incident : Bool?
	public var has_invoice : Bool?
	public var imprint_number : String?
	public var last_updated_date : String?
	public var leadtime_to_ship : Int?
	public var order_additional_fields : [String]?
	public var order_id : String?
	public var order_lines : [Order_lines]?
	public var order_state : String?
	public var order_state_reason_code : String?
	public var order_state_reason_label : String?
	public var paymentType : String?
	public var payment_type : String?
	public var payment_workflow : String?
	public var price : Double?
	public var promotions : PromotionsMkpMirakl?
	public var quote_id : String?
	public var shipping_carrier_code : String?
	public var shipping_company : String?
	public var shipping_price : Double?
	public var shipping_tracking : String?
	public var shipping_tracking_url : String?
	public var shipping_type_code : String?
	public var shipping_type_label : String?
	public var shipping_zone_code : String?
	public var shipping_zone_label : String?
	public var shop_id : Int?
	public var shop_name : String?
	public var total_commission : Double?
	public var total_price : Double?

    public required init?(map: Map) {
        
    }

	public func mapping(map: Map) {

		acceptance_decision_date <- map["acceptance_decision_date"]
		can_cancel <- map["can_cancel"]
		can_evaluate <- map["can_evaluate"]
		channel <- map["channel"]
		commercial_id <- map["commercial_id"]
		created_date <- map["created_date"]
		currency_iso_code <- map["currency_iso_code"]
		customer <- map["customer"]
		customer_debited_date <- map["customer_debited_date"]
		has_customer_message <- map["has_customer_message"]
		has_incident <- map["has_incident"]
		has_invoice <- map["has_invoice"]
		imprint_number <- map["imprint_number"]
		last_updated_date <- map["last_updated_date"]
		leadtime_to_ship <- map["leadtime_to_ship"]
		order_additional_fields <- map["order_additional_fields"]
		order_id <- map["order_id"]
		order_lines <- map["order_lines"]
		order_state <- map["order_state"]
		order_state_reason_code <- map["order_state_reason_code"]
		order_state_reason_label <- map["order_state_reason_label"]
		paymentType <- map["paymentType"]
		payment_type <- map["payment_type"]
		payment_workflow <- map["payment_workflow"]
		price <- map["price"]
		promotions <- map["promotions"]
		quote_id <- map["quote_id"]
		shipping_carrier_code <- map["shipping_carrier_code"]
		shipping_company <- map["shipping_company"]
		shipping_price <- map["shipping_price"]
		shipping_tracking <- map["shipping_tracking"]
		shipping_tracking_url <- map["shipping_tracking_url"]
		shipping_type_code <- map["shipping_type_code"]
		shipping_type_label <- map["shipping_type_label"]
		shipping_zone_code <- map["shipping_zone_code"]
		shipping_zone_label <- map["shipping_zone_label"]
		shop_id <- map["shop_id"]
		shop_name <- map["shop_name"]
		total_commission <- map["total_commission"]
		total_price <- map["total_price"]
	}

}
