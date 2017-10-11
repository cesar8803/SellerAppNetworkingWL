//
//  DatosSoms.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Guillermo Cuevas García on 28/08/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class DatosSoms: Mappable{
    public var Calle: String?
    public var MultiplesDirecciones: String?
    public var Estatus: String?
    public var Asentamiento: String?
    public var Estado: String?
    public var NumeroInt: String?
    public var Delegacion: String?
    public var IdDireccion: String?
    public var TipoFestejado: String?
    public var YCalle: String?
    public var Nombre: String?
    public var IdCliente: String?
    public var Cp: String?
    public var Telefono: String?
    public var Email: String?
    public var Municipio: String?
    public var EntreCalle: String?
    public var Colonia: String?
    public var direccionCompleta: String?

    public required init?(map: Map){
    }
    public func mapping(map: Map){
        Calle <- map["Calle"]
        MultiplesDirecciones <- map["MultiplesDirecciones"]
        Estatus <- map["Estatus"]
        Asentamiento <- map["Asentamiento"]
        Estado <- map["Estado"]
        NumeroInt <- map["NumeroInt"]
        Delegacion <- map["Delegacion"]
        IdDireccion <- map["IdDireccion"]
        TipoFestejado <- map["TipoFestejado"]
        YCalle <- map["YCalle"]
        Nombre <- map["Nombre"]
        IdCliente <- map["IdCliente"]
        Cp <- map["Cp"]
        Telefono <- map["Telefono"]
        Email <- map["Email"]
        Municipio <- map["Municipio"]
        EntreCalle <- map["EntreCalle"]
        
        var address: [String] = []
        
        if let calle: String = Calle, !calle.isEmpty {
            address.append(calle)
        }
        
        if let colonia: String = Colonia, !colonia.isEmpty {
            address.append("Colonia \(colonia)")
        }

        if let delegacion: String = Delegacion, !delegacion.isEmpty {
            address.append("Delegación \(delegacion)")
        }
        
        if let edo: String = Estado, !edo.isEmpty {
            address.append("Estado \(edo)")
        }

        if let zip: String = Cp, !zip.isEmpty {
            address.append("CP \(zip)")
        }

        direccionCompleta = address.joined(separator: ", ")
        
    }
}
