//
//  WorklightServiceProvider.swift
//  WorklightServices
//
//  Created by Luis Cuevas on 12/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import Alamofire


public class WorklightServiceProvider : WorklightServiceProtocol
{
    var manager = SessionManager.default
    
    public enum Environment: Int {
        case Production, QA, Development, Deloitte, Custom, UAT
    }
    
    var environment: Environment = .Production
    var customHostname: String = ""
    var hostname: String {
        switch self.environment
        {
        case .Production:       return "http://172.16.204.118:9195"
        case .QA:               return "http://172.16.204.251:9080"
        case .Development:      return "http://172.16.204.118:9195"
        case .Deloitte:         return "http://10.28.113.65:9080"
        case .UAT:              return "https://172.16.204.118:9195/AppVendedor"
        case .Custom:           return "\(self.customHostname)"
        }
    }
    
    private func isUAT(environment : Environment, customHostName : String) -> Bool {
        return  (environment == .Custom && customHostname == "https://172.16.204.118:9195/AppVendedor")
    }
    
    private let worklightRuntimeEnvironment = "/invoke?"
    
    private enum Adapter: String {
        case CapturaClientesCredito = "CapturaClientesCredito"
        case CatalogosCredito = "CatalogosCredito"
        case CICS = "Cicstran"
        case DEM = "DEM"
        case Genericos = "SKUGenerico"
        case Inventario = "SKUInventario"
        //*** This should be temporary until SOMSConsultaA Adapter is merged with SOMSConsultaNA. For more information see LSAA-1413 or ask Carazo.
        case ConsultaPool = "SOMSConsultaN"
        //***
        case ConsultaPoolBroker = "BrokerSOMSConsulta"
        case SOMSRefund  = "SOMSDevoluciones"
        case ActualizacionPool = "SOMSActualizacionN"
        case BridgeCore = "LiverpoolWebService"
        case Details = "ProductDetailMashup"
        case Browse = "CatalogSearchBrowse"
        case Lookahead = "LookAheadService"
        case Endeca = "EndecaSearchServiceREST"
        case Catalog = "ProductCatalogActor"
        case CustomerSurvey = "EncuestasWS"
        case ShoeInventory = "SolicitudArticulosBodegaWebService"
        case Email = "EmailService"
        case SSO = "SSOWebService"
        case ShoppingList = "ShoppingListPag"
        case Configuration = "Configuraciones"
        case NoSpot = "Catalogos"
        case Shipment = "Remisiones"
        case Scool = "SCOL"
        case CustomerInfo = "ConsultaDatosCliente"
        case MDMWebService = "MDMWebService"
        case ArchivosWS = "ArchivosWebService"
        case ReporteVentas = "ReporteVentas"
        case Presupuesto = "Presupuesto"
        case BrokerSoms = "BrokerSOMSActualizacion"
        case APVServicios = "APVServiciosATG"

    }
    
    private enum Procedure: String {
        //CapturaClientesCredito
        case Login = "CapturaClientesCreditoService_Login"
        case SetSolicitudCredito = "CapturaClientesCreditoService_setSolicitudCredito"
        case subirArchivo = "CapturaClientesCreditoService_subirArchivo"
        case subirFirma = "CapturaClientesCreditoService_subirArchivoFirma"
        
        //CatalogosCredito
        case CatAntigDom = "catAntigDom"
        case CatAntigEmp = "catAntigEmp"
        case CatLADA = "catLADA"
        case CatEstados = "catEstados"
        case CatOrgTipoTarj = "catOrgTipoTarj"
        
        //CICS
        case SegmentedCardBalance = "CicsRequestService_saldoSegmento"
        case CardBalance = "CicsRequestService_saldoCredito"
        case MonederoBalance = "CicsRequestService_saldoMonedero"
        
        // SOMS
        case ConsultaEMA                = "DEMograficos_ConsultaEMA"
        case ConsultaCalle              = "DEMograficos_ConsultaCalleCP"
        case ConsultaEdo                = "DEMograficos_ConsultaEdo"
        case ConsultaMun                = "DEMograficos_ConsultaMun"
        case ConsultaAsent              = "DEMograficos_ConsultaAsent"
        case SOMSLogin                  = "SOMSActualizacionPoolService_getLoginPool"
        case GetCustomers               = "SOMSConsultaPoolService_getConsultaClientesListaPool"
        case GetAddresses               = "SOMSConsultaPoolService_getConsultaClientesDireccionesListaPool"
        case CreateAddress              = "SOMSActualizacionPoolService_setAltaDireccion"
        case CreateCustomer             = "SOMSActualizacionPoolService_setAltaCliente"
        case CreateOrder                = "SOMSActualizacionPoolService_setAltaOrden"
        case CreateOrderWithSKUs        = "SOMSActualizacionPoolService_setAltaOrdenListaSkus"
        case ModifyOrder                = "SOMSActualizacionPoolService_setModificaOrden"
        case AppendSku                  = "SOMSActualizacionPoolService_setAgregaSKU"
        case SOMSDetails                = "SOMSConsultaPoolService_getConsultaSKUPool"
        case DetailSOMS                 = "ConsultaSKUPool"
        case AvailableToShip            = "productAvailableToShip"
        case CreateRefundOrder          = "NotificacionDevoluciones_CrearOrdenDevBT"
        case ModifyOrderAddress         = "SOMSActualizacionPoolService_setModificaOrdenDireccion"
        case AltaClienteDireccion       = "AltaClienteDireccion"
        case AltaOrdenR2                = "AltaOrden"
        case updateOrderDeliveryDate    = "Remisiones_wbi_ActualizarOBS_FechaEntregaBT"

        
        // Endeca
        case ProductDetails = "getProductDetail"
        case CatalogBrowse = "getCatalogSearch"
        case Lookahead = "LookAheadProcedure"
        case AllCategoryInfo = "searchAllCategoryInfo"
        case ChildCategories = "getChildCategories"
        
        // Inventario
        case SkuInventario = "SKUINVENTARIO_ConsultaSku_Inventario"
        case UpdateInventary = "CambiarInventarioATG"
        
        // Genericos
        case SkuGenericos = "SKUGENERICOS_ConsultaSku_Genericos"
        
        // Customer survey
        case Submit = "RegistrarEncuesta"
        case GetQuestions = "ConsultarDetalleEncuesta"
        case GetSurveyId = "BuscarEncuesta"
        
        // Shoe Inventory
        case RegisterTerminalForRemoteNotifications = "registrarTerminal"
        case CreateShoesOrder = "generarSolicitud"
        case UpdateShoesOrder = "actualizarEstado"
        case GetShoesOrders = "obtenerSolicitudes"
        
        // Email
        case SendEmail = "sendEmailWithAttachments"
        
        // SSO
        case ValidateToken = "credencialValida"
        
        //Persistent Shopping List
        case InsertClient = "insertarCliente"
        case EraseClient = "borrarCliente"
        case SearchClients = "buscarClientes"
        case SearchClient = "buscarCliente"
        case SearchClientData = "buscarDatosCliente"
        case AddSku = "agregarSku"
        case RemoveSku = "quitarSku"
        
        // Configuration
        case GetEmployeeSections = "ObtenerSeccionesEmpleado"
        case GetATGSectionsFromSAP = "ObtenerSeccionGrupoATG"
        case GetParameter = "consultarParametro"
        
        //No Spot
        case NoSpotSections = "ValidarSeccionNoSpot"
        case ValidNoSpotSections = "ListaSeccionesNoSpot"
        case SearchStoresCC = "obtenerTiendasCCPorEstado"
        case ConsultarEstadosTiendasCC = "consultarEstadosTiendasCC"
        case ObtenerDatosTienda = "obtenerDatosTienda"
        
        //No Spot Gift Registry
        case GiftRegistryTypes          = "obtenerTiposMesa"
        case GiftRegistryList           = "CicsRequestService_listaEvento"
        case GiftRegistrySearch         = "CicsRequestService_busquedaEvento"
        
        // Shipment
        case CreateUpdateSOMSShipmentSterling   = "Remisiones_wbi_CrearActualizarOVREMSterling"
        case CreateUpdateSOMSShipment           = "Remisiones_wbi_CreaActualizaOVREM"
        case CreateShipment                     = "Remisiones_wbi_CrearOrden"
        case UpdateShipment                     = "Remisiones_wbi_ActualizaRemision"
        case CreateUpdateCC                     = "Remisiones_wbi_CrearActualizarOVREMCCBRK"
        
        // Order Follow Up
        case GetOrderDetail             = "Remisiones_wbi_consulta_orden"
        case UpdateDateCommentOrder     = "Remisiones_wbi_ActualizarOBS_FechaEntregaBTR1"
        case GetScoolDetail             = "ConsultaOrdenVentaRespService_ConsultaOrdenVenta"
        
        // Shopping list
        case SearchAddressCustomer      = "DatosCliente_BuscarDireccionCliente"
        case SearchCustomer             = "DatosCliente_BusquedaCliente"
        
        //CRM Integration
        case CRMGetClientInfo = "obtenerDatosCliente"
        case CRMSaveClientEmail = "agregarEmail"
        
        //SurveyImageRequest
        case SurveyImageRequest = "obtenerArchivo"
        case InsertarRegistro = "insertarRegistro"
        
        // Check if product is "saleable"
        case ValidSaleExtendedCatalog = "isValidToSaleByExtendedCatalog"
        
        //Budget
        case SaveBudget = "Alta_Presupuesto"
        case EstimatedDeliveryDate = "consultarFechaEstimadaEntrega"
    }
    
    //1 - WL up
    // 2 - WL Down
    static var currentWLStatus = "1"
    
    //Test setAgregaSKU Timeout
    var testSetAgregaSKUTimeout = false
    
    // MARK: - Initializers
    
    public init(environment: Environment = .Production, customHostname: String = "", shouldIgnoreSSL : Bool = false)
    {
        SessionManager.default.session.configuration.timeoutIntervalForRequest = 500
        
        self.environment = environment
        
        self.customHostname = customHostname
        
        if isUAT(environment: self.environment, customHostName: self.customHostname) && shouldIgnoreSSL == true {
            ignoreSSL()
        }
        
        self.manager.session.configuration.httpAdditionalHeaders = self.defaultHeaders()
        self.manager.session.configuration.timeoutIntervalForRequest = 60
    }

    public func ignoreSSL() {
        
        self.manager.delegate.sessionDidReceiveChallenge = { session, challenge in
            var disposition: URLSession.AuthChallengeDisposition = .performDefaultHandling
            var credential: URLCredential?
            
            
            if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
                disposition = URLSession.AuthChallengeDisposition.useCredential
                credential = URLCredential(trust: challenge.protectionSpace.serverTrust!) //(forTrust: challenge.protectionSpace.serverTrust!)
            } else {
                if challenge.previousFailureCount > 0 {
                    disposition = .cancelAuthenticationChallenge
                } else {
                    credential = self.manager.session.configuration.urlCredentialStorage?.defaultCredential(for: challenge.protectionSpace)
                    
                    if credential != nil {
                        disposition = .useCredential
                    }
                }
            }
            
            return (disposition, credential)
        }
        
    }
    
    // MARK: - Helper Methods
    
    private func getRequestUrlForAdapter(adapter: Adapter, procedure: Procedure, parameters: AnyObject, isArray:Bool = false) -> String
    {
        let encodedParameters = worklightEncodedParameterDictionary(parameters: parameters, isArray: isArray)
        return self.customHostname + self.worklightRuntimeEnvironment + "adapter=\(adapter.rawValue)&" + "procedure=\(procedure.rawValue)&" + "compressResponse=true&" + "parameters=\(encodedParameters)"
    }
    
    
    private func worklightEncodedParameterDictionary(parameters: AnyObject , isArray: Bool = false) -> String
    {
        var data:NSData!
        do {
            data = try JSONSerialization.data(withJSONObject: parameters, options: JSONSerialization.WritingOptions()) as NSData
        }
        catch {
            return ""
        }
        var jsonString = NSString(data: data as Data, encoding: String.Encoding.utf8.rawValue)!
        jsonString = jsonString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)! as NSString

        // BEFORE
        //jsonString = jsonString.addingPercentEscapes(using: String.Encoding.utf8.rawValue)! as NSString
        
        
        //There must be a better way to handle the URL expecting a plus sign to be encoded, even when a string value
        jsonString = jsonString.replacingOccurrences(of: "+", with: "%2B") as NSString
        //Need to wrap the JSON in [] for the worklight server
        if !isArray {
            jsonString = "[\(jsonString)]" as NSString
        }
        return jsonString as String
    }

    // MARK: - Helpers
    
    private func defaultHeaders() -> Dictionary<String, AnyObject>{
        
        let appVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        let buildNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
        let systemVersion = UIDevice.current.systemVersion
        let deviceModel = UIDevice.current.model
        
        let headers = [
            //"x-wl-clientlog-deviceId": UIDevice.currentDevice().identifierForVendor!.UUIDString,
            "x-wl-clientlog-appname": "AppVendedor",
            "x-wl-clientlog-appversion":  "\(appVersion) (\(buildNumber))",
            "x-wl-clientlog-osversion": systemVersion,
            "x-wl-clientlog-env": "mobilewebapp",
            "x-wl-clientlog-model": deviceModel
        ]
        return headers as Dictionary<String, AnyObject>
        
    }

    
    public func addressesForCustomerWithLada(userId: String, token: String, lada: String, telefono: String, cteTelefono: String, selectRecord: String, trySingleAddress: Bool) {
        
    }
    public func addShoppingSku(sku: String, storeNumber store: String, clientName: String, id: String, idTipoSku: String, createdAt: String) {
        
    }
    public func addSKUAndQuantityToSOMSOrder(userId: String, token: String, sku: String, quantity: String, orderNumber: String, noSpotSku: String?, noSpotQuantity: String?) {
        
    }
    public func allStatesInRepublic(completion: @escaping (WorklightResponse?, NSError?) -> Void) {
        
        let requestParameters = ["ConsultaEdoRequest" : []]
        let url = getRequestUrlForAdapter(adapter: .DEM, procedure: .ConsultaEdo, parameters: requestParameters as AnyObject)
        
        _ = manager.request(url).responseWorklight { [weak self](response) in
            guard let weakSelf = self else { return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            DispatchQueue.main.async {
                
                completion(result, error)
            }
        }
        
    }
    public func applyForCard(inApMaterno: String, inApPaterno: String, inClavePromotoria: String, inColorTarjeta: String, inEdad: Int, inEmpleadoPromotor: String, inFechaNacimiento: String, inFuenteCaptacion: String, inNombre: String, inNumFolio: String, inSexo: String, inTiendaAdmon: String, inTiendaCaptura: String, inAntiguadadDom: String, inCalleyNum: String, inCiudadMun: String, inColonia: String, inCP: String, inEdo: String, inEdoCivil: String, inEmpresaNegocio: String, inLadaDom: String, inNumDependientes: String, inPuestoDepto: String, inTelCel: String, inTelDom: String, inTipoVivienda: String, inAntiguedadEmp: String, inEmbosado: String, inIngresosTot: String, inLadaOfi: String, inTelOfi: String, inOrganization: String, inType: String, inPassword: String, inUser: String, vAmbiente: String) {
        
    }
    public func asensInStateWithId(estadoId: String, municipleId: String, completion: @escaping (WorklightResponse?, NSError?) -> Void) {
        
        let requestParameters = ["ConsultaAsentRequest" : ["id_edo" : estadoId, "id_mun" : municipleId]]
        let url = getRequestUrlForAdapter(adapter: .DEM, procedure: .ConsultaAsent, parameters: requestParameters as AnyObject)
        
        _ = manager.request(url).responseWorklight { [weak self](response) in
            guard let weakSelf = self else { return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            DispatchQueue.main.async {
                
                completion(result, error)
            }
        }
        
    }
    public func bigTicketAvailableToShipWithSku(userId: String, productsArray: [[String:String]], zip: String, completion: @escaping (WorklightResponse?, NSError?) -> Void) {
        
        let requestParameters = ["ProductAvailableToShip":["IdUsuario": userId, "inCP": zip, "skuList": productsArray]]
        let url = getRequestUrlForAdapter(adapter: .ConsultaPoolBroker, procedure: .AvailableToShip, parameters: requestParameters as AnyObject)
        
        _ = self.manager.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseWorklight { [weak self] response in
            
            guard let weakSelf = self else { return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            DispatchQueue.main.async {
                completion(result, error)
            }
        }
    }
    
    public func softLineAvailableToShipWithSku(productsArray: [[String:String]], completion: @escaping (WorklightResponse?, NSError?) -> Void){
        
        let requestParameters = ["isValidToDisplayRequest":["skuList": productsArray]]
        let url = getRequestUrlForAdapter(adapter: .APVServicios, procedure: .ValidSaleExtendedCatalog, parameters: requestParameters as AnyObject)
        
        _ = self.manager.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseWorklight { [weak self] response in
            
            guard let weakSelf = self else { return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            DispatchQueue.main.async {
                completion(result, error)
            }
        }
    }
    
    public func streetsCP(zip: String, completion: @escaping (WorklightResponse?, NSError?) -> Void) {
        
        let requestParameters = ["ConsultaCalleCPRequest" : ["cp" : zip]]
        let url = getRequestUrlForAdapter(adapter: .DEM, procedure: .ConsultaCalle, parameters: requestParameters as AnyObject)
        
        _ = manager.request(url).responseWorklight { [weak self](response) in
            guard let weakSelf = self else { return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            DispatchQueue.main.async {
                
                completion(result, error)
            }
        }
        
    }
    public func streetsInAsen(asen: String, withCP cp: String, completion: @escaping (WorklightResponse?, NSError?) -> Void) {
        
        let requestParameters = ["ConsultaCalleCPRequest" : ["cp" : cp, "in_asen" : asen]]
        let url = getRequestUrlForAdapter(adapter: .DEM, procedure: .ConsultaCalle, parameters: requestParameters as AnyObject)
        
        _ = manager.request(url).responseWorklight { [weak self](response) in
            guard let weakSelf = self else { return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            DispatchQueue.main.async {
                
                completion(result, error)
            }
        }

        
    }
    public func cancelSurveyInProgress(surveyId: String, storeId: String, sectionId: String, employeeId: String, employeeName: String, ticketNumber: String, storeZone: String, storeAbbreviation: String) {
        
    }
    public func catAntigDom() {
        
    }
    public func catAntigEmp() {
        
    }
    public func catEstados() {
        
    }
    public func catLADA() {
        
    }
    public func catOrgTipoTarjeta(product: String, subProduct: String) {
        
    }
    public func changeDeliveryDateOfSKUOnSOMSOrder(userId: String, token: String, orderNumber: String, sku: String, date: String, originalDateString: String) {
        
    }
    public func changeSKUToClienteAvisaOnSOMSOrder(userId: String, token: String, orderNumber: String, sku: String) {
        
    }
    public func neighborhoodInZip(zip: String, completion: @escaping (WorklightResponse?, NSError?) -> Void) {
        
        let requestParameters = ["ConsultaEMARequest" : ["cp" : zip]]
        let url = getRequestUrlForAdapter(adapter: .DEM, procedure: .ConsultaEMA, parameters: requestParameters as AnyObject)
        
        _ = manager.request(url).responseWorklight { [weak self](response) in
            guard let weakSelf = self else { return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            DispatchQueue.main.async {
                completion(result, error)
            }
        }
    }
    public func createAddress(userId: String, token: String, isNewStreet: Bool, zip: String, calle: String, numeroExterior: String, selectRecordAsen: String, selectRecordCliente: String, tipoAsen: String, lada: String, telefono: String, betweenStreet: String?, andStreet: String?, interiorNumber: String?, edificio: String?) {
        
    }
    public func createCCOrder(lada: String, phone: String, name: String, userId: String, token: String, products: [WorklightShippingProduct]?, storeNumber: String, storeNumberToSend: String, orderNumber: String, isNewCustomer: Bool, isBigTicketOrder: Bool, email: String?, completion: @escaping (WorklightResponse?, NSError?) -> Void) {
        
        let paddedLada = String(format: "%03d", Int(lada) ?? 0)
        let charset = NSCharacterSet(charactersIn: "/%&=?$#+-~@<>|\\*,.()[]{}^!").inverted//NSCharacterSet(charactersInString: "/%&=?$#+-~@<>|\\*,.()[]{}^!").inverted
        
        if let orderLines = (products?.map {
            [
                "OrderedQty" : "\($0.quantity)",
                "Item" : [
                    "itemID" : $0.itemSKU,
                    "itemDesc" : $0.itemDescription.addingPercentEncoding(withAllowedCharacters: charset) ?? "" //.stringByAddingPercentEncodingWithAllowedCharacters(charset) ?? ""
                ],
                "LinePriceInfo" : [
                    "unitPrice" : $0.price
                ]
            ]
            }) {
            
            let order = [
                "OrderName" : storeNumber,
                "OrderType" : "Personal",
                "OrderNo" : orderNumber
            ]
            
            var setOrdenSterlingDictionary:  [String : Any] = [:]
            
            if !isBigTicketOrder {
                setOrdenSterlingDictionary = [
                    "Order" : order,
                    "OrderLines" : orderLines,
                ]
            }
            
            let params = [
                [
                    "BusquedaClienteRequest":
                        [
                            "Calle": "",
                            "Colonia": "",
                            "Cp": "",
                            "Estado": "",
                            "Lada": paddedLada,
                            "Nombre": name,
                            "Telefono": phone,
                            "IdUsuario":userId,
                    ]
                ],
                /*[
                    "inPassword" : "",
                    "inUser" : userId,
                    "inCadenaValidacion" : token,
                    "isNewStreet" : "False"
                ],*/
                [
                    "CreaActualizaOVREMRequest": [
                        "Evento": "",
                        "IdDestinatatio": "",
                        "IdDireccionDestino": (isNewCustomer ? "001" : ""),
                        "IdDireccionRemitente": "",
                        "IdRemision": orderNumber,
                        "IdRemitente": "",
                        "TipoEvento": "",
                        "Bandera_APV": "T",
                        "inUser" : userId,
                        "inCadenaValidacion" : token,
                        "Usuario": userId
                    ],
                    "setOrdenSterling": setOrdenSterlingDictionary
                ],
                storeNumberToSend
            ] as [Any]
            
            let url = getRequestUrlForAdapter(adapter: .Shipment, procedure: .CreateUpdateCC, parameters: params as AnyObject, isArray: true)
            
            _ = manager.request(url).responseWorklight { [weak self](response) in
                guard let weakSelf = self else { return }
                let (result, error) = weakSelf.parseWorklightResponse(response)
                DispatchQueue.main.async {
                    completion(result, error)
                }
            }
        }
        
    }
    public func createCustomer(userId: String, clientId: String, lada: String, phone: String, lastName: String, firstName: String, zip: String, exteriorNumber: String, street: String, neighborhood: String, district: String, state: String, idLada: String, idPhone:String,  secondLastName: String?, rfc: String?, comment: String?, email: String?, betweenStreet: String?, andStreet: String?, interiorNumber: String?, building: String?, createStreet: Bool?, completion: @escaping (WorklightResponse?, NSError?) -> Void) {
        
        let paddedLada = String(format: "%03d", Int(lada) ?? 0)
        let requestParameters = [
            "AltaClienteDireccionRequest" : [
                "setAltaClienteFilters" : [
                    "crearCalle" : createStreet ?? false,
                    "idUsuario" : userId,
                    "idCliente" : clientId,
                    "inLada" : paddedLada,
                    "inTelefono" : phone,
                    "inApMaterno" : secondLastName ?? "",
                    "inApPaterno" : lastName,
                    "inEmail" : email!,
                    "inNombre1" : firstName,
                    "inNombre2" : "",
                    "inRFC" : rfc!,
                    "inCP" : zip,
                    "inComentario" : comment ?? "",
                    "inAsentamiento" : neighborhood,
                    "inDelegacionMunicipio" : district,
                    "inEstado" : state,
                    "idLadaDireccion" : idLada,
                    "idTelefonoDireccion" : idPhone,
                    "inCalle" : street,
                    "inEntreCalle" : betweenStreet!.replacingOccurrences(of: "&", with: "%26"),
                    "inYCalle" : andStreet!,
                    "inEdif" : building!,
                    "inNumeroInt" : interiorNumber ?? "",
                    "inNumeroExt" : exteriorNumber
                ]
            
            ]
        
        ]
        
        /*
        let isNewStreetString = isNewStreet == true ? "True" : ""
        let requestParameters = [
            "setAltaCliente" : [
                "ModelVariables" : [
                    "inPassword" : "",
                    "inUser" : userId,
                    "inCadenaValidacion" : token,
                    "isNewStreet" : isNewStreetString
                ],
                "setAltaClienteFilters" : [
                    "inApMaterno" : materno!,
                    "inApPaterno" : paterno,
                    "inCP" : zip,
                    "inEmail" : email!,
                    "inNombre1" : firstName,
                    "inNumeroExt" : exteriorNumber,
                    "inRFC" : rfc!,
                    "inSelectRecordAsentamiento" : selectRecordAsen,
                    "inSelectRecordTipoAsentamiento" : tipoAsen,
                    "inTelefono" : telefono,
                    "inCalle" : calle,
                    "inLada" : lada,
                    "inEntreCalle" : betweenStreet!.replacingOccurrences(of: "&", with: "%26"),
                    "inYCalle" : andStreet!,
                    "inEdif" : edificio!,
                    "inNumeroInt" : interiorNumber!,
                    "inComentario" : comment!
                ]
            ]
        ]*/
        let url = getRequestUrlForAdapter(adapter: .BrokerSoms, procedure: .AltaClienteDireccion, parameters: requestParameters as AnyObject)
        
        _ = manager.request(url).responseWorklight { [weak self](response) in
            guard let weakSelf = self else { return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            DispatchQueue.main.async {
                completion(result, error)
            }
        }
        
        
    }
    public func createShipmentOrder(orderID: String, storeNumber: String, customerFirstName: String, customerLastName: String, products: [WorklightShippingProduct]?, shippingAdress: WorklightShippingAddress) {
        
    }
    public func createShoesOrder(terminalId: Int, products: [Dictionary<String, AnyObject>]) {
        
    }
    public func createShoppingClient(name: String, email: String?, storeNumber store: String, idVendedor: String, fechaRegistro: String, skuList: [[String : String]], imageStringData: String?, completion: @escaping (WorklightResponse?, NSError?) -> Void) {
        
        var clientParams: [String : Any] = ["tienda" : store, "nombre_cliente" : name, "idVendedor" : idVendedor, "fechaRegistro" : fechaRegistro]
        
        if let email = email {
            if !email.isEmpty {
                clientParams["email"] = email
            }
        }
        
        if skuList.count > 0 {
            clientParams["listaSKU"] = skuList
        }
        
        let params: [String : Any] = ["cliente" : clientParams]
        
        let url = getRequestUrlForAdapter(adapter: .ShoppingList, procedure: .InsertClient, parameters: params as AnyObject)
        
        _ = manager.request(url).responseWorklight { [weak self](response) in
            guard let weakSelf = self else { return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            DispatchQueue.main.async {
                
                completion(result, error)
            }
        }
        
        
    }
    
    public func createSOMSOrderR2(parameters: Any, completion: @escaping (WorklightResponse?, NSError?) -> Void) {
      /*
        let parameters = [
            
            "AltaOrdenRequest" : [
                
                "setAltaOrdenFilters" : [
                    "IdUsuario": "ADMSOMS1",
                    "IdClienteRemitente": "",
                    "IdDireccionRemitente": "",
                    "idCliente": "0000052120",
                    "idDireccion": "001",
                    "idEventoTarjeta": "",
                    "idTipoFestejado": "",
                    "idLadaOrden": "",
                    "idTelefonoOrden": "",
                    "inObservaciones": ""
                    
                ],
                
                "setAgregaSKUFilters" : [
                    
                    "setAgregaSKURecord" : [
                        [
                            "inSelectRecordSKU": "0000056111",
                            "inSelectRecordSKUCantidad": "1",
                            "inSelectRecordSKUNoSpot": "",
                            "inSelectRecordSKUNoSpotCantidad": ""
                        ],
                        [
                            "inSelectRecordSKU": "0000056120",
                            "inSelectRecordSKUCantidad": "1",
                            "inSelectRecordSKUNoSpot": "",
                            "inSelectRecordSKUNoSpotCantidad": ""
                        ]
                        
                    ]
                    
                ]
                
            ]
            
        ]
        */
        let url = getRequestUrlForAdapter(adapter: .BrokerSoms, procedure: .AltaOrdenR2, parameters: parameters as AnyObject)
        
        _ = manager.request(url).responseWorklight { [weak self](response) in
            guard let weakSelf = self else { return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            DispatchQueue.main.async {
                completion(result, error)
            }
        }
        
    }
    
    
    
    
    public func createSOMSOrder(userId: String, token: String, firstProductSku: String, firstProductQuantity: String, firstProductNoSpotSku: String?, firstProductNoSpotQuantity: String?, lada: String?, telefono: String?, fldTelefono: String?, selectRecordCliente: String?, selectRecordSku: String, selectRecordAsentamiento: String?, orderComment: String?, singleAddressCustomer: Bool, eventID: String?) {
        
    }
    public func createSOMSOrder(userId: String, token: String, lada: String, telefono: String, fldTelefono: String, selectRecordCliente: String?, selectRecordAsentamiento: String?, orderComment: String?, singleAddressCustomer: Bool, eventID: String?, products: [WorklightSOMSProduct]!) {
        
    }
    public func createSOMSOrderLight(userId: String, token: String, lada: String, telefono: String, fldTelefono: String, selectRecordCliente: String, selectRecordAsentamiento: String, orderComment: String?, singleAddressCustomer: Bool, eventID: String?, products: [WorklightSOMSProduct]!) {
        
    }
    public func createSOMSRefundOrder(deliveryOrder: String, comments: String, products: [[String : String]], username: String, validationString: String, completion: @escaping (WorklightResponse?, NSError?) -> Void) {
        
        let parameters = ["CrearOrdenDevBTRequest" : ["OrdenEntrega" : deliveryOrder,
                                                      "Comentarios" : comments,
                                                      "Productos" : products,
                                                      "Usuario" : "",
                                                      "inUser" : username,
                                                      "inCadenaValidacion" : validationString]]
        
        let url = getRequestUrlForAdapter(adapter: .SOMSRefund, procedure: .CreateRefundOrder, parameters: parameters as AnyObject)
        
        _ = manager.request(url).responseWorklight { [weak self](response) in
            guard let weakSelf = self else { return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            DispatchQueue.main.async {
                
                completion(result, error)
            }
        }
        
        
    }
    public func createUpdateSOMSShipmentOrder(shipmentID: String, customerID: String, addressID: String, currentStoreInventory: Bool, eventID: String?, senderID: String?, senderAddressID: String?, celebratedType: String?, token: String, userId: String) {
        
    }
    public func createUpdateSOMSShipmentOrderSterling(orderID: String, orderType: String, storeNumber: String, customerFirstName: String, customerLastName: String, senderCustomerFirstName: String, senderCustomerLastName: String, products: [WorklightShippingProduct]?, shippingAddress: WorklightShippingAddress, shipmentID: String, customerID: String, addressID: String, currentStoreInventory: Bool, eventID: String?, senderID: String?, senderAddressID: String?, celebratedType: String?, typeEvent: String, userId: String, completion: @escaping (WorklightResponse?, NSError?) -> Void) {
        
        //assert(products?.count > 0, "We MUST have at least one product!")
        
        let charset = NSCharacterSet(charactersIn: "/%&=?$#+-~@<>|\\*,.()[]{}^!").inverted
        
        if let orderLines = (products?.map {
            [
                "OrderedQty" : "\($0.quantity)",
                "Item" : [
                    "itemID" : $0.itemSKU,
                    "itemDesc" : $0.itemDescription.addingPercentEncoding(withAllowedCharacters: charset) ?? ""
                ],
                "LinePriceInfo" : [
                    "unitPrice" : $0.price
                ]
            ]
            }) {
            
            let order = [
                "OrderName" : storeNumber,
                "OrderType" : "Personal",
                "OrderNo" : orderID
            ]
            
            let params: [String : Any] = [
                "CreaActualizaOVREMRequest": [
                    "Evento": eventID ?? "",
                    "IdDestinatatio": customerID,
                    "IdDireccionDestino": addressID,
                    "IdDireccionRemitente": senderID ?? "",
                    "IdRemision": orderID,
                    "IdRemitente": senderAddressID ?? "",
                    "TipoEvento": celebratedType ?? "",
                    //enviado en T por solicitud de team BackEnd
                    "Bandera_APV": "T",
                    "inUser" : userId,
                    "Usuario": userId
                ],
                "setOrdenSterling": [
                    "Order" : order,
                    "OrderLines" : orderLines,
                    "PersonInfoBillTo" : [
                        "firstName"    : customerFirstName,
                        "lastName"     : customerLastName,
                        "addressLine1" : shippingAddress.street,
                        "addressLine2" : shippingAddress.number,
                        "addressLine3" : shippingAddress.interiorNumber,
                        "addressLine4" : shippingAddress.settlement,
                        "addressLine5" : shippingAddress.township,
                        "city"         : shippingAddress.city,
                        "state"        : shippingAddress.state,
                        "zipCode"      : shippingAddress.zipCode,
                        "dayPhone"     : shippingAddress.homePhone,
                        "mobilePhone"  : shippingAddress.mobilePhone
                    ],
                    "PersonInfoContact": [
                        "firstName"    : customerFirstName,
                        "lastName"     : customerLastName,
                        "addressLine1" : shippingAddress.street,
                        "addressLine2" : shippingAddress.number,
                        "addressLine3" : shippingAddress.interiorNumber,
                        "addressLine4" : shippingAddress.settlement,
                        "addressLine5" : shippingAddress.township,
                        "city"         : shippingAddress.city,
                        "state"        : shippingAddress.state,
                        "zipCode"      : shippingAddress.zipCode,
                        "dayPhone"     : shippingAddress.homePhone,
                        "mobilePhone"  : shippingAddress.mobilePhone
                    ],
                    "PersonInfoShipTo": [
                        "firstName"    : customerFirstName,
                        "lastName"     : customerLastName,
                        "addressLine1" : shippingAddress.street,
                        "addressLine2" : shippingAddress.number,
                        "addressLine3" : shippingAddress.interiorNumber,
                        "addressLine4" : shippingAddress.settlement,
                        "addressLine5" : shippingAddress.township,
                        "city"         : shippingAddress.city,
                        "state"        : shippingAddress.state,
                        "zipCode"      : shippingAddress.zipCode,
                        "dayPhone"     : shippingAddress.homePhone,
                        "mobilePhone"  : shippingAddress.mobilePhone
                    ]
                ]
            ]
            
            let url = getRequestUrlForAdapter(adapter: .Shipment, procedure: .CreateUpdateSOMSShipmentSterling, parameters: params as AnyObject)
            
            _ = manager.request(url).responseWorklight { [weak self](response) in
                guard let weakSelf = self else { return }
                let (result, error) = weakSelf.parseWorklightResponse(response)
                DispatchQueue.main.async {
                    
                    completion(result, error)
                }
            }
        }
        
    }
    public func creditBalanceForAccount(accountNumber: String, pin: String) {
        
    }
    public func customerAddressByID(customerID: String, neighborhood: String, street: String, completion: @escaping (WorklightResponse?, NSError?) -> Void) {
        
        let params = [
            "BuscarDireccionClienteRequest" : [
                "Calle": street,
                "Colonia": neighborhood,
                "Cp": "",
                "Estado": "",
                "IdCliente": customerID
            ]
        ]
        
        let url = getRequestUrlForAdapter(adapter: .CustomerInfo, procedure: .SearchAddressCustomer, parameters: params as AnyObject)
        
        _ = manager.request(url).responseWorklight { [weak self](response) in
            guard let weakSelf = self else { return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            DispatchQueue.main.async {
                
                completion(result, error)
            }
        }
        
    }
    public func customerInfoByLada(lada: String, phone: String, name: String, isGiftRegistry: Bool, completion: @escaping (WorklightResponse?, NSError?) -> Void) {
        
        let paddedLada = String(format: "%03d", Int(lada) ?? 0)
        let params = [
            "BusquedaClienteRequest": [
                "Calle": "",
                "Colonia": "",
                "Cp": "",
                "Estado": "",
                "Lada": paddedLada,
                "Nombre": name,
                "Telefono": phone,
                "MesaRegalos": isGiftRegistry
            ]
        ]
        
        let url = getRequestUrlForAdapter(adapter: .CustomerInfo, procedure: .SearchCustomer, parameters: params as AnyObject)
        
        _ = manager.request(url).responseWorklight { [weak self](response) in
            guard let weakSelf = self else { return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            DispatchQueue.main.async {
                
                completion(result, error)
            }
        }
        
    }
    
    /*******************/
    
    public func customerAddressByIDBroker(customerID: String, neighborhood: String, street: String, userId: String, completion: @escaping (WorklightResponse?, NSError?) -> Void) {
        
        /*
         {
         "BuscarDireccionClienteRequest": {
         "IdUsuario":"pbamobi2",
         "Calle": "",
         "Colonia": "",
         "Cp": "",
         "Estado": "",
         "IdCliente": "0001922528"
         }
         }
         */
        
        let params = [
            "BuscarDireccionClienteRequest" : [
                "IdUsuario" : userId,
                "Calle": street,
                "Colonia": neighborhood,
                "Cp": "",
                "Estado": "",
                "IdCliente": customerID
            ]
        ]
        
        let url = getRequestUrlForAdapter(adapter: .ConsultaPoolBroker, procedure: .SearchAddressCustomer, parameters: params as AnyObject)
        
        _ = manager.request(url).responseWorklight { [weak self](response) in
            guard let weakSelf = self else { return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            DispatchQueue.main.async {
                
                completion(result, error)
            }
        }
        
    }
    public func customerInfoByLadaBroker(lada: String, phone: String, name: String, userId: String, eventId: String, completion: @escaping (WorklightResponse?, NSError?) -> Void) {
        
        /*
         "IdUsuario":"9669",
         "Calle": "",
         "Colonia": "",
         "Cp": "",
         "Estado": "",
         "Lada": "55",
         "Nombre": "",
         "Telefono": "53259000",
         "Evento": ""
         */
        
        let paddedLada = String(format: "%03d", Int(lada) ?? 0)
        let params = [
            "BusquedaClienteRequest": [
                "IdUsuario" : userId,
                "Calle": "",
                "Colonia": "",
                "Cp": "",
                "Estado": "",
                "Lada": paddedLada,
                "Nombre": name,
                "Telefono": phone,
                "Evento": eventId
            ]
        ]
        
        let url = getRequestUrlForAdapter(adapter: .ConsultaPoolBroker, procedure: .SearchCustomer, parameters: params as AnyObject)
        
        _ = manager.request(url).responseWorklight { [weak self](response) in
            guard let weakSelf = self else { return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            DispatchQueue.main.async {
                
                completion(result, error)
            }
        }
        
    }
    /******************/
    public func customersWithEvent(eventID: String, userId: String, token: String) {
        
    }
    public func customersWithLada(lada: String, telefono: String, userId: String, token: String) {
        
    }
    public func detailsForProductWithSku(sku: String, storeNumber: String, buscaProducto: Dictionary<String, AnyObject>, completion: @escaping (WorklightResponse?, NSError?) -> Void) {
        
        let requestParameters = ["ProductDetail" : ["sku" : sku, "almacenId" : storeNumber, "buscaProducto": buscaProducto]]
        let url = getRequestUrlForAdapter(adapter: .Details, procedure: .ProductDetails, parameters: requestParameters as AnyObject)
        
        _ = manager.request(url).responseWorklight { [weak self](response) in
            guard let weakSelf = self else { return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            DispatchQueue.main.async {
                
                completion(result, error)
            }
        }
        
    }
    public func eraseShoppingClient(clientId: String, storeNumber: String) {
        
    }
    public func getAllCategoryInfo(completion: @escaping (WorklightResponse?, NSError?) -> Void) {
                
        let url = self.getRequestUrlForAdapter(adapter: .Endeca, procedure: .AllCategoryInfo, parameters: Dictionary<String, Any>() as AnyObject)
        
        _ = manager.request(url).responseWorklight { [weak self](response) in
            guard let weakSelf = self else { return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            DispatchQueue.main.async {

                completion(result, error)
            }
        }
        
    }
    public func getChildCategories(categoryId: String) {
        
    }
    public func getCustomerEmail(userId: String, token: String, lada: String, telefono: String, cteTelefono: String, selectRecord: String, trySingleAddress: Bool) {
        
    }
    public func getLoginPool(username: String, password: String, userId: String, token: String) {
        
    }
    public func getQuestionsForSurveyId(id: String) {
        
    }
    public func getSectionsEligibleForNoSpot(completion: @escaping (WorklightResponse?, NSError?) -> Void) {
        
        let url = self.getRequestUrlForAdapter(adapter: .NoSpot, procedure: .NoSpotSections, parameters: Dictionary<String, AnyObject>() as AnyObject)
        
        _ = manager.request(url).responseWorklight { [weak self](response) in
            guard let weakSelf = self else { return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            DispatchQueue.main.async {
                
                completion(result, error)
            }
        }
        
    }
    public func getSectionsOfValidNoSpotSkus() {
        
    }
    public func getShoesOrders(terminalId: Int, isWarehouse: Bool) {
        
    }
    public func getStoreDetail(store: String, completion: @escaping (WorklightResponse?, NSError?) -> Void) {
        
        let params = [
            "requestObtenerDatosTienda" : [
                "numeroTienda" : store
            ]
        ]
        let url = getRequestUrlForAdapter(adapter: .NoSpot, procedure: .ObtenerDatosTienda, parameters: params as AnyObject)
        
        _ = manager.request(url).responseWorklight { [weak self](response) in
            guard let weakSelf = self else { return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            DispatchQueue.main.async {
                
                completion(result, error)
            }
        }
        
    }
    public func getSurveyId(paymentTypes: [Int]) {
        
    }
    public func inventoryDetailsForSOMSItemWithSku(userId: String, sku: String, zip: String, completion: @escaping (WorklightResponse?, NSError?) -> Void) {
        
        let requestParameters = ["ConsultaSKUPoolRequest" : [
            "getConsultaSKUPoolFilters" : [
                "IdUsuario": userId,
                "inCP" : zip,
                "inSKU": sku]
            ]
        ]
        let url = getRequestUrlForAdapter(adapter: .ConsultaPoolBroker, procedure: .DetailSOMS, parameters: requestParameters as AnyObject)
        
        _ = self.manager.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseWorklight { [weak self] response in
            
            guard let weakSelf = self else { return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            DispatchQueue.main.async {
                
                completion(result, error)
            }
        }
        
    }
    public func isValidToSaleByExtendedCatalog(sku: [String]) {
        
    }
    public func loginWithUsername(username: String, password: String, usernameToken: String, validationString: String, environmentVariable: String, completion: @escaping (WorklightResponse?, NSError?) -> Void) {
        
        let requestParameters: [String : Any] = ["Login" : ["LoginFilters" :
            ["inUser" : username,
             "inPassword" : password,
             "inUsuario": usernameToken,
             "inCadenaValidacion" : validationString],
                                            "ModelVariables" : ["vAmbiente" : environmentVariable]]]
        let url = self.getRequestUrlForAdapter(adapter: .CapturaClientesCredito, procedure: .Login, parameters: requestParameters as AnyObject)
        
        _ = self.manager.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseWorklight { [weak self] response in
        
            guard let weakSelf = self else { return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            DispatchQueue.main.async {
                
                completion(result, error)
            }
        }
        
    }
    public func lookAheadSuggestionsForKeyword(keyword: String) {
        
    }
    public func monederoBalanceForAccount(accountNumber: String) {
        
    }
    public func districtsInStateWithId(estadoId: String, completion: @escaping (WorklightResponse?, NSError?) -> Void) {
        
        let requestParameters = ["ConsultaMunRequest" : ["id_edo" : estadoId]]
        let url = getRequestUrlForAdapter(adapter: .DEM, procedure: .ConsultaMun, parameters: requestParameters as AnyObject)
        
        _ = manager.request(url).responseWorklight { [weak self](response) in
            guard let weakSelf = self else { return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            DispatchQueue.main.async {
                completion(result, error)
            }
        }
        
    }
    public func orderFollowUpGetOrderDetail(orderNumber: String, completion: @escaping (_ response: WorklightResponse?, _ error: NSError?) -> Void) {
        
        let params = [
            "consulta_ordenRequest" : [
                "IndicadorConsulta" : (orderNumber.hasPrefix("90") ? "OV" : "RM"),
                "OrdenEntrega_Remision" : orderNumber
            ]
        ]
        
        let url = getRequestUrlForAdapter(adapter: .Shipment, procedure: .GetOrderDetail, parameters: params as AnyObject)
        
        _ = manager.request(url).responseWorklight { [weak self](response) in
            guard let weakSelf = self else { return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            DispatchQueue.main.async {
                completion(result, error)
            }
        }
        
    }
    
    public func orderFollowUpScool(orderNumber: String, idRegional: String, completion: @escaping (_ response: WorklightResponse?, _ error: NSError?) -> Void) {
        
        let params = [
            "ConsultaOrdenVentaReq" : [
                "ConsultaOrdenVentaRequest": [
                    "numOrden" : orderNumber,
                    "idCentroRegional" : idRegional
                ]
                
            ]
        ]
        
        let url = getRequestUrlForAdapter(adapter: .Scool, procedure: .GetScoolDetail, parameters: params as AnyObject)
        
        _ = manager.request(url).responseWorklight { [weak self](response) in
            guard let weakSelf = self else { return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            DispatchQueue.main.async {
                completion(result, error)
            }
        }
        
    }
    
    public func orderFollowUpUpdateDeliveryDate(orderNumber: String, sku: String?, date: String?, comments: String?, token: String, userId: String, completion: @escaping (_ response: WorklightResponse?, _ error: NSError?) -> Void) {
        
        
        let params = [
            "ActualizarOBS_FechaEntregaBTRequest" : [
                "FechaPropuesta"    : date ?? "",
                "IndicadorServicio" : (comments == nil ? "FEC" : "OBS"),
                "IndicadorTipo"     : (orderNumber.hasPrefix("90") ? "OV" : "RM"),
                "Observaciones"     : comments ?? "",
                "OrdenEntrega"      : orderNumber,
                "SKU"               : sku ?? "",
                "Usuario"           : "",
                "inCadenaValidacion": token,
                "inUser"            : userId
            ]
        ]
        
        let url = getRequestUrlForAdapter(adapter: .Shipment, procedure: .UpdateDateCommentOrder, parameters: params as AnyObject)
        
        _ = manager.request(url).responseWorklight { [weak self](response) in
            guard let weakSelf = self else { return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            DispatchQueue.main.async {
                completion(result, error)
            }
        }
        
    }
    
    public func updateOrderDeliveryDate(order: String, sku: String, date: String, comments: String?, user_id: String, completion:  @escaping (_ response: WorklightResponse?, _ error: NSError?) -> Void) {
        
        /*
        {
            "ActualizarOBS_FechaEntregaBTRequest": {
                "FechaPropuesta": "2016-06-06",
                "inUser": "123",
                "IndicadorTipo": "OV",
                "IndicadorServicio": "FEC",
                "Observaciones": "",
                "SKU": "1018866800",
                "OrdenEntrega": "9009227548",
                "Usuario": "123"
            }
        }
        */
        
        let params = [
            "ActualizarOBS_FechaEntregaBTRequest" : [
                "FechaPropuesta" : date,
                "inUser": user_id,
                "IndicadorTipo": order.hasPrefix("90") ? "OV" : "RM",
                "IndicadorServicio": comments == nil ? "FEC" : "OBS",
                "Observaciones": comments ?? "",
                "SKU": sku,
                "OrdenEntrega": order,
                "Usuario": user_id
            ]
        ]
    
        let url = getRequestUrlForAdapter(adapter: .Shipment, procedure: .updateOrderDeliveryDate, parameters: params as AnyObject)
        
        _ = manager.request(url).responseWorklight { [weak self](response) in
            guard let weakSelf = self else { return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            DispatchQueue.main.async {
                completion(result, error)
            }
        }
    
    }
    
    public func productsForCategoryId(categoryId: String, page: String?, facets: [String]?, storeNumber: String, completion: @escaping (WorklightResponse?, NSError?) -> Void) {
        
        var childParameters:[String:Any] = ["almacenId" : storeNumber, "categoryId" : categoryId]
        if let page = page {
            childParameters["page"] = page
        }
        if let facets = facets {
            childParameters["facets"] = facets
        }
        let requestParameters = ["CatalogSearch" : childParameters]
        
        let url = getRequestUrlForAdapter(adapter: .Browse, procedure: .CatalogBrowse, parameters: requestParameters as AnyObject)
        
        _ = manager.request(url).responseWorklight { [weak self](response) in
            guard let weakSelf = self else { return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            DispatchQueue.main.async {
                completion(result, error)
            }
        }
        
    }
    public func productsForKeyword(keyword: String, page: String?, facets: [String]?, storeNumber: String, completion: @escaping (WorklightResponse?, NSError?) -> Void) {
        
        let charset = NSCharacterSet(charactersIn: "/%&=?$#+-~@<>|\\*,.()[]{}^!").inverted
        
        
        var childParameters:[String: Any] = ["almacenId" : storeNumber, "s" : keyword.addingPercentEncoding(withAllowedCharacters: charset) ?? ""]
        if let page = page {
            childParameters["page"] = page
        }
        if let facets = facets {
            childParameters["facets"] = facets
        }
        let requestParameters = ["CatalogSearch" : childParameters]
        let url = getRequestUrlForAdapter(adapter: .Browse, procedure: .CatalogBrowse, parameters: requestParameters as AnyObject)
        
        _ = manager.request(url).responseWorklight { [weak self](response) in
            guard let weakSelf = self else { return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            DispatchQueue.main.async {

                completion(result, error)
            }
        }
        
    }
    public func registerTerminalForRemoteNotificationsWithStoreId(storeId: String, sectionId: String, deviceId: String, employeeName: String?, idEmployee: Int, isWarehouse: Bool) {
        
    }
    public func removeShoppingSku(sku: String, id: String) {
        
    }
    public func requestSurveyImage(imageName: String, update: Bool) {
        
    }
    public func resetWLStatus() {
        
    }
    public func retrieveGiftRegistry(eventID: String, completion: @escaping (WorklightResponse?, NSError?) -> Void) {
        let params = [
            "TSCMES11": [
                "evento": eventID,
                "tipo": ""
            ]
        ]
        
        let url = getRequestUrlForAdapter(adapter: .CICS, procedure: .GiftRegistryList, parameters: params as AnyObject)
        
        _ = self.manager.request(url).responseWorklight { [weak self](response) in
            guard let weakSelf = self else{ return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            
            DispatchQueue.main.async {
                completion(result, error)
            }
        }
        
        
    }
    public func retrieveGiftRegistryTypes(completion: @escaping (WorklightResponse?, NSError?) -> Void) {
     
        let params = ["obtenerTiposMesaRequest": []]
        
        let url = getRequestUrlForAdapter(adapter: .NoSpot, procedure: .GiftRegistryTypes, parameters: params as AnyObject)
        
        _ = self.manager.request(url).responseWorklight { [weak self](response) in
            guard let weakSelf = self else{ return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            
            DispatchQueue.main.async {
                completion(result, error)
            }
            
        }

        
    }
    
    public func retrieveGiftRegistryWithApplicationType(eventID: String, appType: Bool, completion: @escaping (WorklightResponse?, NSError?) -> Void) {
        
        let params = [
            "TSCMES11": [
                "evento": eventID,
                "tipo": ""
            ]
        ]
        
        let url = getRequestUrlForAdapter(adapter: .CICS, procedure: .GiftRegistryList, parameters: params as AnyObject)
        
        _ = self.manager.request(url).responseWorklight { [weak self](response) in
            guard let weakSelf = self else{ return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            
            DispatchQueue.main.async {
                completion(result, error)
            }
            
        }
        
    }
    public func retrieveRestrictedSKUsForShipping() {
        
    }
    public func salesReport(items: AnyObject) {
        
    }
    public func searchCCStates(completion: @escaping (WorklightResponse?, NSError?) -> Void) {
        
        let url = getRequestUrlForAdapter(adapter: .NoSpot, procedure: .ConsultarEstadosTiendasCC, parameters: [:] as AnyObject)
        
        _ = self.manager.request(url).responseWorklight { [weak self](response) in
            guard let weakSelf = self else{ return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            
            DispatchQueue.main.async {
                completion(result, error)
            }
            
        }

        
    }
    public func searchCCStores(state: String, completion: @escaping (WorklightResponse?, NSError?) -> Void) {
        
        let params = [
            "obtenerTiendasCCPorEstadoRequest" : [
                "idEstado" : state
            ]
        ]
        let url = getRequestUrlForAdapter(adapter: .NoSpot, procedure: .SearchStoresCC, parameters: params as AnyObject)
        
        _ = self.manager.request(url).responseWorklight { [weak self](response) in
            guard let weakSelf = self else{ return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            
            DispatchQueue.main.async {
                completion(result, error)
            }
            
        }
        
        
    }
    public func searchGiftRegistry(name: String!, lastName: String!, secondLastName: String!, date: String!, type: NSNumber!, gender: String!, completion: @escaping (WorklightResponse?, NSError?) -> Void) {
        
        let params = [
            "TSCMES12": [
                "nombre": name ?? "",
                "paterno": lastName ?? "",
                "materno": secondLastName ?? "",
                "fechaDe": date ?? "",
                "tipo": type ?? 0,
                "sexo": gender ?? ""
            ]
        ]
        
        let url = getRequestUrlForAdapter(adapter: .CICS, procedure: .GiftRegistrySearch, parameters: params as AnyObject)
        
        _ = self.manager.request(url).responseWorklight { [weak self](response) in
            guard let weakSelf = self else{ return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            
            DispatchQueue.main.async {
                completion(result, error)
            }
            
        }
        
        
    }
    public func searchShoppingClient(clientId: String, storeNumber: String) {
        
    }
    public func searchShoppingClients(clientName: String, storeNumber: String, idVendedor: String, fechaInicio: String, fechaFin: String, email: String, page: String?, elementsPerPage: String?, completion: @escaping (WorklightResponse?, NSError?) -> Void) {
        
        
        var innerParams: [String : String] = ["nombre" : clientName, "tienda" : storeNumber, "idVendedor" : idVendedor, "fechaInicio" : fechaInicio, "fechaFin" : fechaFin, "email" : email]
        if let page = page {
            innerParams["pagina"] = page
        }
        if let elementsPerPage = elementsPerPage {
            innerParams["elementosPorPagina"] = elementsPerPage
        }
        let params = ["buscarClientes" : innerParams]
        let url = getRequestUrlForAdapter(adapter: .ShoppingList, procedure: .SearchClients, parameters: params as AnyObject)
        
        _ = self.manager.request(url).responseWorklight { [weak self](response) in
            guard let weakSelf = self else{ return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            
            DispatchQueue.main.async {
                completion(result, error)
            }
            
        }
        
        
    }
    public func segmentedCreditBalanceForAccount(accountNumber: String, pin: String) {
        
    }
    public func sendEmailTo(to: String, to2: String, cc: String, withTitle title: String, message: String, storeType: String, attachment: (fileName: String, mimeType: String, data: NSData)?, withInfo info: [String : Any], completion: @escaping (WorklightResponse?, NSError?) -> Void) {
        
        var parameters: [String : Any] = [
            "storeType": storeType,
            "to": to,
            "to2": to2,
            "cc": cc,
            "subject": title,
            "message": message
        ]
        
        for (key, value) in info{
        
            parameters[key] = value
        }
        
        if let attachment = attachment {
            parameters["fileName"] = attachment.fileName
            parameters["attachmentData"] = attachment.data.base64EncodedString(options: .lineLength64Characters)
        }
        
        let requestURL = self.getRequestUrlForAdapter(adapter: .Email, procedure: .SendEmail, parameters: [:] as AnyObject)
        
        var authHeader  = [
            "user-em": "appVendedor",
            "password":  "smtpAdmin"
        ]
        
        let httpHeaderDic = self.defaultHeaders()
        
        for (key, value) in httpHeaderDic {
            authHeader[key] = value as? String
        }
        
        // Serialize parameters into a JSON string
        var jsonParametersString: String!
        
        do {

            
            jsonParametersString = try String(data: JSONSerialization.data(withJSONObject: parameters, options: .init(rawValue: 0)), encoding: .utf8)
        }
        catch {
            
        }
        
        jsonParametersString = replaceSpecialCharacters(jsonParametersString)
        
        let requestParameters: [String : Any]  = [
            "json": jsonParametersString,
        ]


        _ = self.manager.request(requestURL, method: .post, parameters: requestParameters, encoding: URLEncoding.default, headers: authHeader).responseWorklight{ [weak self](response) in
                guard let weakSelf = self else{ return }
                let (result, error) = weakSelf.parseWorklightResponse(response)
            
                DispatchQueue.main.async {
                    completion(result, error)
            }
        }
        
    }
    
    private func replaceSpecialCharacters(_ characters: String) -> String{
    
        /*
         á    %C3%A1
         é    %C3%A9
         í    %C3%AD
         ó    %C3%B3
         ú    %C3%BA
         Á    %C3%81
         É    %C3%89
         Í    %C3%8D
         Ó    %C3%93
         Ú    %C3%9A
         Ñ    %C3%91
         ñ    %C3%B1
         ¿    %C2%BF
         ?    %3F
         ¡    %C2%A1
         */
        
        var newString = characters
        
        newString = newString.replacingOccurrences(of: "á", with: "%C3%A1")
        newString = newString.replacingOccurrences(of: "é", with: "%C3%A9")
        newString = newString.replacingOccurrences(of: "í", with: "%C3%AD")
        newString = newString.replacingOccurrences(of: "ó", with: "%C3%B3")
        newString = newString.replacingOccurrences(of: "ú", with: "%C3%BA")
        newString = newString.replacingOccurrences(of: "Á", with: "%C3%81")
        newString = newString.replacingOccurrences(of: "É", with: "%C3%89")
        newString = newString.replacingOccurrences(of: "Í", with: "%C3%8D")
        newString = newString.replacingOccurrences(of: "Ó", with: "%C3%93")
        newString = newString.replacingOccurrences(of: "Ú", with: "%C3%9A")
        newString = newString.replacingOccurrences(of: "Ñ", with: "%C3%91")
        newString = newString.replacingOccurrences(of: "ñ", with: "%C3%B1")
        newString = newString.replacingOccurrences(of: "¿", with: "%C3%BF")
        newString = newString.replacingOccurrences(of: "?", with: "%3F")
        newString = newString.replacingOccurrences(of: "¡", with: "%C2%A1")
        
        
        return newString
        
    }
    public func skuGenericosForSku(sku: String) {
        
    }
    public func skuInventarioWithSku(sku: String, completion: @escaping (WorklightResponse?, NSError?) -> Void) {
        
        let parameters = ["ConsultaSku_InventarioRequest" : ["Articulo" : sku]]
        let url = getRequestUrlForAdapter(adapter: .Inventario, procedure: .SkuInventario, parameters: parameters as AnyObject)
        
        _ = self.manager.request(url).responseWorklight { [weak self](response) in
            guard let weakSelf = self else{ return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            
            DispatchQueue.main.async {
                completion(result, error)
            }
        }
    }
    public func ssoTokenIsValid(token: String, systemID: String, userId: String) {
        
    }
    public func subirArchivo(imageStringData: String, aplicacion: String, numFolio: String, org: String, logo: String, almacen: String, nombre: String, apPaterno: String, apMaterno: String) {
        
    }
    public func submitSurveyResponses(responses: [AnyObject], surveyId: String, storeId: String, sectionId: String, employeeId: String, employeeName: String, ticketNumber: String, storeZone: String, storeAbbreviation: String) {
        
    }
    public func updateCustomerAddressSOMS(orderNumber: String, lada: String, telephone: String, inFldTelephone: String, clientRecord: String, inEvent: String, inEventCard: String, inCard: String, selectRecordAsen: String, eventLada: String, inTelephoneEvent: String, isMoreDir: String, inPassword: String, inUser: String, token: String) {
        
    }
    public func updateShoesOrder(requestId: Int, terminalId: Int, state: Int) {
        
    }
    
    public func saveBudget(withInfo info: [String : Any], completion: @escaping (WorklightResponse?, NSError?) -> Void){
        
        let url = getRequestUrlForAdapter(adapter: .Presupuesto, procedure: .SaveBudget, parameters: info as AnyObject)
        
        _ = self.manager.request(url).responseWorklight { [weak self](response) in
            guard let weakSelf = self else{ return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            
            DispatchQueue.main.async {
                completion(result, error)
            }
            
        }
    }
    
    public func updateInventory(forProcedure procedure: String, withProducts products: [WorklightShippingProduct], completion: @escaping (WorklightResponse?, NSError?) -> Void) {
        
        
        var params: [String : Any] = [:]
        var skus: [Any] = []
        var sku: [String : Any] = [:]
        
        for product in products{
        
            sku["skuId"] = product.itemSKU
            sku["quantity"] = product.quantity
            
            skus.append(sku)
        }
        
        params["skuInventory"] = skus
        params["operation"] = procedure
        
        let url = getRequestUrlForAdapter(adapter: .APVServicios, procedure: .UpdateInventary, parameters: params as AnyObject)
        
        _ = self.manager.request(url).responseWorklight { [weak self](response) in
            guard let weakSelf = self else{ return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            
            DispatchQueue.main.async {
                completion(result, error)
            }
            
        }
    }
    
    /*
    func checkIfServiceDown(serviceError:NSError?)
    {
        if let err = serviceError
        {
            if ((err.code == 3840 && err.localizedDescription == "Servicio no disponible.") || (err.code == -1005) || (err.code == -1004)) && WorklightServiceProvider.currentWLStatus != "2"
            {
                WorklightServiceProvider.currentWLStatus = "2"
                //Post notification here
                NSNotificationCenter.defaultCenter().postNotificationName("WLStatusChanged", object: WorklightServiceProvider.currentWLStatus)
            }
        }
        else if WorklightServiceProvider.currentWLStatus == "2"
        {
            WorklightServiceProvider.currentWLStatus = "1"
            //Post notification here
            NSNotificationCenter.defaultCenter().postNotificationName("WLStatusChanged", object: WorklightServiceProvider.currentWLStatus)
        }
    }
    
    public func resetWLStatus()
    {
        WorklightServiceProvider.currentWLStatus = "1"
    }*/
    
    func parseWorklightResponse(_ response: DataResponse<Data>)->(WorklightResponse?, NSError?){
    
        if response.error != nil {
            return (nil, response.error! as NSError)
        }else{
            if let json = try? JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as? [String : Any]{
                if let wlResponse = WorklightResponse(JSON: json!){
                    return (wlResponse, nil)
                }else{
                    return (nil, NSError(domain: "worklight.object", code: WorklightErrorCodes.WLResponseParser.rawValue, userInfo: [NSLocalizedDescriptionKey : "No se pudo crear el objeto Worklight Response"]))
                }
            }else{
                return (nil, NSError(domain: "json.parser", code: WorklightErrorCodes.JSONParser.rawValue, userInfo: [NSLocalizedDescriptionKey : "La respuesta no viene en el formato correcto"]))
            }
            
        }
        

    }
    
    // MARK: - Remote Configuration Parameters
    
    public func getConfigurationParameter(name: String, completion: @escaping (WorklightResponse?, NSError?) -> Void)
    {
        let params = [
            "consultarParametroRequest" : [
                "nombre": name
            ]
        ]
        
        let url = getRequestUrlForAdapter(adapter: .NoSpot, procedure: .GetParameter, parameters: params as AnyObject)
        _ = self.manager.request(url).responseWorklight { [weak self](response) in
            guard let weakSelf = self else{ return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            
            DispatchQueue.main.async {
                completion(result, error)
            }
            
        }
    }
    
    public func saveSignature(withFile file: String, andTerminal terminal: String, andStore store: String, documentNumber document: String, andUserId userId: String, withVoucherNumber voucherNumber: String, andVoucherDate voucherDate: String, andVoucherTime voucherTime: String, andAuthorization authorization: String, completion: @escaping (WorklightResponse?, NSError?) -> Void) {
        
        let parameters = ["subirArchivoFirmaRequest" : ["terminal" : terminal, "tienda" : store, "documento" : document, "vendedor" : userId, "voucherNumero" : voucherNumber, "voucherFecha" : voucherDate, "voucherHora" : voucherTime, "numAutorizacion" : authorization ] ]
        
        let url = self.getRequestUrlForAdapter(adapter: .CapturaClientesCredito, procedure: .subirFirma, parameters: parameters as AnyObject)
        
        /*
        var serializedJSONParameters:String!
        
        do {
            serializedJSONParameters = try NSString(data: NSJSONSerialization.dataWithJSONObject(["stringFile" : file], options: NSJSONWritingOptions()), encoding: NSUTF8StringEncoding) as! String
        }
        catch {
            completion(false, "", nil)
            return
        }*/
        
        var jsonParametersString: String!
        
        do {
            
            jsonParametersString = try String(data: JSONSerialization.data(withJSONObject: ["stringFile" : file], options: .init(rawValue: 0)), encoding: .utf8)
        }
        catch {
            
        }
        
        let stringDataParameters: [String : Any] = ["json": jsonParametersString]
        
        _ = self.manager.request(url, method: .post, parameters: stringDataParameters, encoding: URLEncoding.default, headers: nil).responseWorklight { [weak self] (response) in
            
            guard let weakSelf = self else{ return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            
            DispatchQueue.main.async {
                completion(result, error)
            }
        }
        /*_ = self.manager.request(url, method: .post, parameters: stringDataParameters, encoding: URLEncoding.default, headers: self.defaultHeaders()).responseWorklight{ [weak self](response) in
            guard let weakSelf = self else{ return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            
            DispatchQueue.main.async {
                completion(result, error)
            }
        }*/
        
        
        /*
        self.manager.request(.POST, url, parameters: stringDataParameters, encoding: .URL).responseWorklight { response -> Void in
            
            self.checkIfServiceDown(response.result.error)
            
            if (response.result.error != nil) {
                completion(false, response.result.error!.localizedDescription, response.result.error)
            }
            else {
                let jsonValue = JSON(response.result.value!)
                
                if (jsonValue["isSuccessful"].bool == true) {
                    if let outMessage = jsonValue["outMessage"].string {
                        completion(true, outMessage, nil)
                    }
                    else {
                        completion(true, "", nil)
                    }
                }
                else {
                    if let errors = jsonValue["errors"].array {
                        completion(false, "", self.errorWithErrorsArray(errors))
                    }
                    else {
                        completion(false, "", response.result.error)
                    }
                    
                }
            }
        }*/
    }
    
    
    //MARK: - Card's Balance
    
    public func cardBalance(numeroCuenta: String, noValidaPin:String="1", completion: @escaping (WorklightResponse?, NSError?) -> Void) {
        
        let requestParameters = ["TSCCRE03":["numeroCuenta": numeroCuenta, "noValidaPin": noValidaPin]]
        
        let url = getRequestUrlForAdapter(adapter: .CICS, procedure: .CardBalance, parameters: requestParameters as AnyObject)
        
        _ = self.manager.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseWorklight { [weak self] response in
            
            guard let weakSelf = self else { return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            DispatchQueue.main.async {
                completion(result, error)
            }
        }
    }
   
    
    public func walletBalanceForAccount(accountNumber: String, completion:@escaping (WorklightResponse?, NSError?) -> Void) {
        let requestParameters = ["TSCCTE09":["numeroCuenta": accountNumber]]
        let url = getRequestUrlForAdapter(adapter: .CICS, procedure: .MonederoBalance, parameters: requestParameters as AnyObject)
        
        _ = self.manager.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseWorklight { [weak self] response in
            
            guard let weakSelf = self else { return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            DispatchQueue.main.async {
                completion(result, error)
            }
        }
    }
    
    
    //MARK: - Estimated Delivery Date
    
    public func calculateEDD(productsArray: [[String:String]], completion: @escaping (WorklightResponse?, NSError?) -> Void){
        
        let params = [
            "obtenerTiendasCCPorEstadoRequest" : [
                "idEstado" : "prueba"
            ]
        ]
        
        let url = getRequestUrlForAdapter(adapter: .APVServicios, procedure: .EstimatedDeliveryDate, parameters: params as AnyObject)
        
        _ = self.manager.request(url).responseWorklight { [weak self](response) in
            guard let weakSelf = self else{ return }
            let (result, error) = weakSelf.parseWorklightResponse(response)
            
            DispatchQueue.main.async {
                completion(result, error)
            }
            
        }
    }
}

