//
//  Direccion.swift
//  SellerAppNetworkingWL
//
//  Created by Luis Guillermo Cuevas García on 28/08/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class Direccion: Mappable{
    public var Asentamiento: String?
    public var NumeroInt: String?
    public var Numero: String?
    public var Delegacion: String?
    public var Calle: String?
    public var Colonia: String?
    public var YCalle: String?
    public var Cp: String?
    public var Estado: String?
    public var IdDireccioncliente: String?
    public var Municipio: String?
    public var EntreCalle: String?
    public var direccionCompleta: String?
    public var numeroExterior: String?
    
    public required init?(map: Map){
    }
    public func mapping(map: Map){
        Asentamiento <- map["Asentamiento"]
        NumeroInt <- map["NumeroInt"]
        Numero <- map["Numero"]
        Delegacion <- map["Delegacion"]
        Calle <- map["Calle"]
        Colonia <- map["Colonia"]
        YCalle <- map["YCalle"]
        Cp <- map["Cp"]
        Estado <- map["Estado"]
        IdDireccioncliente <- map["IdDireccioncliente"]
        Municipio <- map["Municipio"]
        EntreCalle <- map["EntreCalle"]
        numeroExterior <- map["NumeroExt"]
        
        var colonia: String = ""
        if let col: String = Colonia, !col.isEmpty { colonia = col }
        
        var delegacion: String = ""
        if let del: String = Delegacion, !del.isEmpty { delegacion = del }
        
        var estado: String = ""
        if let edo: String = Estado, !edo.isEmpty { estado = edo }

        var cp: String = ""
        if let zip: String = Cp, !zip.isEmpty { cp = zip }
        
        let completa: [String] = [
            
            Calle ?? "",
            Numero ?? "",
            !colonia.isEmpty ? "Colonia \(colonia)" : "",
            !delegacion.isEmpty ? "Delegación \(delegacion)" : "",
            !estado.isEmpty ? "Estado \(estado)" : "",
            !cp.isEmpty ? "CP \(cp)" : ""
        
        ]
        
        direccionCompleta = completa.joined(separator: ", ")
        
    }
}
