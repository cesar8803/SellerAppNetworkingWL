//
//  Order_lines.swift
//  SellerAppNetworkingMW
//
//  Created by Emmanuel Casanas Cruz on 19/09/18.
//  Copyright © 2018 Liverpool. All rights reserved.
//


import Foundation
import ObjectMapper

public class Order_lines : Mappable {
	public var can_open_incident : Bool?
	public var can_refund : Bool?
	public var cancelations : [String]?
	public var category_code : String?
	public var category_label : String?
	public var commission_fee : Double?
	public var commission_rate_vat : Double?
	public var commission_taxes : [Commission_taxes]?
	public var commission_vat : Double?
	public var created_date : String?
	public var debited_date : String?
	public var description : String?
	public var last_updated_date : String?
	public var offer_id : Int?
	public var offer_sku : String?
	public var offer_state_code : String?
	public var order_line_additional_fields : [String]?
	public var order_line_id : String?
	public var order_line_index : Int?
	public var order_line_state : String?
	public var order_line_state_reason_code : String?
	public var order_line_state_reason_label : String?
	public var price : Double?
	public var price_additional_info : String?
	public var price_unit : Double?
	public var product_medias : [Product_medias]?
	public var product_sku : String?
	public var product_title : String?
	public var promotions : [String]?
	public var quantity : Int?
	public var received_date : String?
	public var refunds : [String]?
	public var shipped_date : String?
	public var shipping_price : Double?
	public var shipping_price_additional_unit : String?
	public var shipping_price_unit : String?
	public var shipping_taxes : [String]?
	public var taxes : [String]?
	public var total_commission : Double?
	public var total_price : Double?

    public required init?(map: Map) {
        
    }

	public func mapping(map: Map) {

		can_open_incident <- map["can_open_incident"]
		can_refund <- map["can_refund"]
		cancelations <- map["cancelations"]
		category_code <- map["category_code"]
		category_label <- map["category_label"]
		commission_fee <- map["commission_fee"]
		commission_rate_vat <- map["commission_rate_vat"]
		commission_taxes <- map["commission_taxes"]
		commission_vat <- map["commission_vat"]
		created_date <- map["created_date"]
		debited_date <- map["debited_date"]
		description <- map["description"]
		last_updated_date <- map["last_updated_date"]
		offer_id <- map["offer_id"]
		offer_sku <- map["offer_sku"]
		offer_state_code <- map["offer_state_code"]
		order_line_additional_fields <- map["order_line_additional_fields"]
		order_line_id <- map["order_line_id"]
		order_line_index <- map["order_line_index"]
		order_line_state <- map["order_line_state"]
		order_line_state_reason_code <- map["order_line_state_reason_code"]
		order_line_state_reason_label <- map["order_line_state_reason_label"]
		price <- map["price"]
		price_additional_info <- map["price_additional_info"]
		price_unit <- map["price_unit"]
		product_medias <- map["product_medias"]
		product_sku <- map["product_sku"]
		product_title <- map["product_title"]
		promotions <- map["promotions"]
		quantity <- map["quantity"]
		received_date <- map["received_date"]
		refunds <- map["refunds"]
		shipped_date <- map["shipped_date"]
		shipping_price <- map["shipping_price"]
		shipping_price_additional_unit <- map["shipping_price_additional_unit"]
		shipping_price_unit <- map["shipping_price_unit"]
		shipping_taxes <- map["shipping_taxes"]
		taxes <- map["taxes"]
		total_commission <- map["total_commission"]
		total_price <- map["total_price"]
	}

}
