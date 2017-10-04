//
//  WorklightShippingAddress.swift
//  WorklightServices
//
//  Created by Nahum Jovan Aranda López on 14/09/15.
//  Copyright (c) 2015 Deloitte Digital. All rights reserved.
//

import UIKit

public class WorklightShippingAddress: NSObject {
    public var street           : String = ""
    public var number           : String = ""
    public var interiorNumber   : String = ""
    public var additionalInfo   : String = ""
    public var settlement       : String = ""
    public var township         : String = ""
    public var city             : String = ""
    public var state            : String = ""
    public var zipCode          : String = ""
    public var homePhone        : String = ""
    public var mobilePhone      : String = ""
    // Store Data:
    public var colony           : String = ""
    public var CCModule         : String = ""
    public var name             : String = ""
    public var key              : String = ""
    public var storeNumber      : String = ""
    public var country          : String = ""
    public var street1          : String = ""
    public var street2          : String = ""
    public var tipoAsentamiento : String = ""
    
    public override init() {
        
    }
    
    public init(worklightResponse: [String : Any]) {
        if let street = worklightResponse["calle"] as? String {
            self.street = street
        }
        if let city = worklightResponse["ciudad"] as? String {
            self.city = city
        }
        if let key = worklightResponse["clave"] as? String {
            self.key = key
        }
        if let colony = worklightResponse["colonia"] as? String {
            self.colony = colony
        }
        if let zipCode = worklightResponse["cp"] as? String {
            self.zipCode = zipCode
        }
        if let street1 = worklightResponse["entreCalle"] as? String {
            self.street1 = street1
        }
        if let state = worklightResponse["estado"] as? String {
            self.state = state
        }
        if let CCModule = worklightResponse["moduloCC"] as? String {
            self.CCModule = CCModule
        }
        if let name = worklightResponse["nombre"] as? String {
            self.name = name
        }
        if let storeNumber = worklightResponse["numTienda"] as? String {
            self.storeNumber = storeNumber
        }
        if let number = worklightResponse["numero"] as? String {
            self.number = number
        }
        if let country = worklightResponse["pais"] as? String {
            self.country = country
        }
        if let homePhone = worklightResponse["telefono"] as? String {
            self.homePhone = homePhone
        }
        if let street2 = worklightResponse["yCalle"] as? String {
            self.street2 = street2
        }
        if let tipoAsentamiento = worklightResponse["tipoAsentamiento"] as? String {
            self.tipoAsentamiento = tipoAsentamiento
        }
    }
}
