//
//  Direccion.swift
//  SellerAppNetworkingWL
//
//  Created by Oscar Morales on 19/09/18.
//  Copyright © 2018 Liverpool. All rights reserved.
//

import Foundation
import ObjectMapper

struct Direccion : Mappable {
	var idEstado : String?
	var numTienda : String?
	var estado : String?
	var clave : String?
	var calle : String?
	var nombre : String?
	var entreCalle : String?
	var idCalle : String?
	var cp : String?
	var yCalle : String?
	var idCiudad : String?
	var telefono : String?
	var moduloCC : String?
	var colonia : String?
	var ciudad : String?
	var pais : String?
	var idColonia : String?
	var tipoAsentamiento : String?
	var numero : String?

	init?(map: Map) {

	}

	mutating func mapping(map: Map) {

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
