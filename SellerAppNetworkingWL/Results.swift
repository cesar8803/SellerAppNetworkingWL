//
//  Results.swift
//  WorklightServices
//
//  Created by Luis Cuevas on 19/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class Results: Mappable{
    var sku: String?
    var buscaBarcode: String?
    var description: String?
    var type: String?
    var brand: String?
    var buscaDescription: String?
    var totalInTransit: String?
    var totalBackordered: String?
    var name: String?
    var price: String?
    var thumbnailImages: [String]?
    var totalInStore: String?
    var attributes: String?
    var largeImages: [String]?
    var availableToShip: Int?
    var totalInWarehouse: String?
    var categoryId: String?
    var categoryName: String?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        sku <- map["sku"]
        buscaBarcode <- map["buscaBarcode"]
        description <- map["description"]
        type <- map["type"]
        brand <- map["brand"]
        buscaDescription <- map["buscaDescription"]
        totalInTransit <- map["totalInTransit"]
        totalBackordered <- map["totalBackordered"]
        name <- map["name"]
        price <- map["price"]
        thumbnailImages <- map["thumbnailImages"]
        totalInStore <- map["totalInStore"]
        attributes <- map["attributes"]
        largeImages <- map["largeImages"]
        availableToShip <- map["availableToShip"]
        totalInWarehouse <- map["totalInWarehouse"]
        categoryId <- map["categoryId"]
        categoryName <- map["categoryName"]
    }
}
