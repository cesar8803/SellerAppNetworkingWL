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
    public var sku: String?
    public var buscaBarcode: String?
    public var description: String?
    public var type: String?
    public var brand: String?
    public var buscaDescription: String?
    public var totalInTransit: String?
    public var totalBackordered: String?
    public var name: String?
    public var price: String?
    public var thumbnailImages: [String]?
    public var totalInStore: String?
    public var attributes: String?
    public var largeImages: [String]?
    public var availableToShip: Int?
    public var totalInWarehouse: String?
    public var categoryId: String?
    public var categoryName: String?
    
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
