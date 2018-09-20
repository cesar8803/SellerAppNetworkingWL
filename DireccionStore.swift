//
//  DireccionStore.swift
//  SellerAppNetworkingWL
//
//  Created by Oscar Morales on 19/09/18.
//  Copyright © 2018 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

public class DireccionStore : Mappable {
	public var idEstado : String?
	public var numTienda : String?
	public var estado : String?
	public var clave : String?
	public var calle : String?
    public var nombre : String?
	public var entreCalle : String?
	public var idCalle : String?
	public var cp : String?
	public var yCalle : String?
	public var idCiudad : String?
	public var telefono : String?
	public var moduloCC : String?
	public var colonia : String?
	public var ciudad : String?
	public var pais : String?
	public var idColonia : String?
	public var tipoAsentamiento : String?
	public var numero : String?

	public required init?(map: Map) {

	}

	public func mapping(map: Map) {

		idEstado <- map["idEstado"]
		numTienda <- map["numTienda"]
		estado <- map["estado"]
		clave <- map["clave"]
		calle <- map["calle"]
		nombre <- map["nombre"]
		entreCalle <- map["entreCalle"]
		idCalle <- map["idCalle"]
		cp <- map["cp"]
		yCalle <- map["yCalle"]
		idCiudad <- map["idCiudad"]
		telefono <- map["telefono"]
		moduloCC <- map["moduloCC"]
		colonia <- map["colonia"]
		ciudad <- map["ciudad"]
		pais <- map["pais"]
		idColonia <- map["idColonia"]
		tipoAsentamiento <- map["tipoAsentamiento"]
		numero <- map["numero"]
	}

}
