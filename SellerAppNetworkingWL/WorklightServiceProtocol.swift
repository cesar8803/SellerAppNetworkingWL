//
//  WorklighServiceProtocol.swift
//  WorklightServices
//
//  Created by Weston Chambers on 2/27/15.
//  Copyright (c) 2015 Deloitte Digital. All rights reserved.
//

import Foundation

enum WorklightErrorCodes: Int{

    case JSONParser = -101
    case WLResponseParser = -102
}

public protocol WorklightServiceProtocol
{
    // CapturaClientesCredito
    func loginWithUsername(username: String, password: String, usernameToken: String, validationString: String, environmentVariable: String, completion: @escaping (WorklightResponse?, NSError?) -> Void)
    func applyForCard(inApMaterno: String, inApPaterno: String, inClavePromotoria: String, inColorTarjeta: String, inEdad: Int, inEmpleadoPromotor: String, inFechaNacimiento: String, inFuenteCaptacion: String, inNombre: String, inNumFolio: String, inSexo: String, inTiendaAdmon: String, inTiendaCaptura: String, inAntiguadadDom: String, inCalleyNum: String, inCiudadMun: String, inColonia: String, inCP: String, inEdo: String, inEdoCivil: String, inEmpresaNegocio: String, inLadaDom: String, inNumDependientes: String, inPuestoDepto: String, inTelCel: String, inTelDom: String, inTipoVivienda: String, inAntiguedadEmp: String, inEmbosado: String, inIngresosTot: String, inLadaOfi: String, inTelOfi: String, inOrganization: String, inType: String, inPassword: String, inUser: String, vAmbiente: String)
    func subirArchivo(imageStringData: String, aplicacion: String, numFolio: String, org: String, logo: String, almacen: String, nombre: String, apPaterno: String, apMaterno: String)
    
    // CatalogosCredito
    func catAntigDom()
    func catAntigEmp()
    func catLADA()
    func catEstados()
    func catOrgTipoTarjeta(product: String, subProduct: String)
    
    // CICS
    func segmentedCreditBalanceForAccount(accountNumber: String, pin: String)
    func creditBalanceForAccount(accountNumber:String, pin: String)
    func monederoBalanceForAccount(accountNumber: String)
    
    //MARK: SOMS
    func neighborhoodInZip(zip: String, completion: @escaping (WorklightResponse?, NSError?) -> Void)
    func allStatesInRepublic(completion: @escaping (WorklightResponse?, NSError?) -> Void)
    func districtsInStateWithId(estadoId: String, completion: @escaping (WorklightResponse?, NSError?) -> Void)
    func asensInStateWithId(estadoId: String, municipleId: String, completion: @escaping (WorklightResponse?, NSError?) -> Void)
    func streetsInAsen(asen: String, withCP cp: String, completion: @escaping (WorklightResponse?, NSError?) -> Void)
    func streetsCP(zip: String, completion: @escaping (WorklightResponse?, NSError?) -> Void)
    
    func getLoginPool(username: String, password: String,userId: String, token: String)
    func customersWithEvent(eventID: String, userId: String, token: String)
    func customersWithLada(lada: String, telefono: String, userId: String, token: String)
    func addressesForCustomerWithLada(userId: String, token: String, lada: String, telefono: String, cteTelefono: String, selectRecord: String,trySingleAddress: Bool)
    func getCustomerEmail(userId: String, token: String, lada: String, telefono: String, cteTelefono: String, selectRecord: String,trySingleAddress: Bool)
    func createAddress(userId: String, token: String, isNewStreet: Bool, zip: String, calle: String, numeroExterior: String, selectRecordAsen: String, selectRecordCliente: String, tipoAsen: String, lada: String, telefono: String,betweenStreet: String?,andStreet:String?, interiorNumber: String?, edificio: String?)
    func createCustomer(userId: String, clientId: String, lada: String, phone: String, lastName: String, firstName: String, zip: String, exteriorNumber: String, street: String, neighborhood: String, district: String, state: String, idLada: String, idPhone:String,  secondLastName: String?, rfc: String?, comment: String?, email: String?, betweenStreet: String?, andStreet: String?, interiorNumber: String?, building: String?, createStreet: Bool?, completion: @escaping (WorklightResponse?, NSError?) -> Void)
    func createSOMSOrderLight(userId: String, token: String, lada: String, telefono: String, fldTelefono: String, selectRecordCliente: String, selectRecordAsentamiento:String, orderComment: String?, singleAddressCustomer: Bool, eventID: String?, products: [WorklightSOMSProduct]!)
    func createSOMSOrder(userId: String, token: String, lada: String, telefono: String, fldTelefono: String, selectRecordCliente: String?, selectRecordAsentamiento:String?, orderComment: String?, singleAddressCustomer: Bool, eventID: String?, products: [WorklightSOMSProduct]!)
    func createSOMSOrder(userId: String, token: String, firstProductSku: String, firstProductQuantity: String, firstProductNoSpotSku: String?, firstProductNoSpotQuantity: String?, lada: String?, telefono: String?, fldTelefono: String?, selectRecordCliente: String?, selectRecordSku: String, selectRecordAsentamiento: String?, orderComment: String?,singleAddressCustomer: Bool, eventID: String?)
    func addSKUAndQuantityToSOMSOrder(userId: String, token: String, sku: String, quantity: String, orderNumber: String,noSpotSku: String?, noSpotQuantity: String?)
    func changeDeliveryDateOfSKUOnSOMSOrder(userId: String, token: String, orderNumber: String, sku: String, date: String, originalDateString: String)
    func changeSKUToClienteAvisaOnSOMSOrder(userId: String, token: String, orderNumber: String, sku: String)
    func inventoryDetailsForSOMSItemWithSku(userId: String, sku: String,zip: String, completion: @escaping (WorklightResponse?, NSError?) -> Void)
    func bigTicketAvailableToShipWithSku(userId: String, token: String, sku: String, zip: String)
    func createSOMSRefundOrder(deliveryOrder: String, comments: String, products: [[String : String]], username: String, validationString: String, completion: @escaping (WorklightResponse?, NSError?) -> Void)
  func updateCustomerAddressSOMS(orderNumber : String, lada: String, telephone : String, inFldTelephone : String, clientRecord : String, inEvent : String, inEventCard : String, inCard : String, selectRecordAsen : String, eventLada : String, inTelephoneEvent : String, isMoreDir : String , inPassword : String, inUser : String, token: String)
  
    //Endeca
    func detailsForProductWithSku(sku: String, storeNumber: String, buscaProducto: Dictionary<String, AnyObject>, completion: @escaping (WorklightResponse?, NSError?) -> Void)
    func productsForCategoryId(categoryId: String, page: String?, facets: [String]?, storeNumber: String, completion: @escaping (WorklightResponse?, NSError?) -> Void)
    func productsForKeyword(keyword: String, page: String?, facets: [String]?, storeNumber: String, completion: @escaping (WorklightResponse?, NSError?) -> Void)
    func lookAheadSuggestionsForKeyword(keyword: String)
    
    func skuInventarioWithSku(sku: String, completion: @escaping (WorklightResponse?, NSError?) -> Void)
    
    // MARK: - Catalog Info
    func getAllCategoryInfo(completion: @escaping (WorklightResponse?, NSError?) -> Void)
    func getChildCategories(categoryId: String)
    
    // MARK: - No Spot
    func getSectionsEligibleForNoSpot(completion: @escaping (WorklightResponse?, NSError?) -> Void)
    func getSectionsOfValidNoSpotSkus()
    
    // MARK: - SKU Genericos
    func skuGenericosForSku(sku: String)
    
    // MARK: - Customer Survey
    func cancelSurveyInProgress(surveyId: String, storeId: String, sectionId: String, employeeId: String, employeeName: String, ticketNumber: String, storeZone: String, storeAbbreviation: String)
    func submitSurveyResponses(responses: [AnyObject], surveyId: String, storeId: String, sectionId: String, employeeId: String, employeeName: String, ticketNumber: String, storeZone: String, storeAbbreviation: String)
    func getQuestionsForSurveyId(id: String)
    func getSurveyId(paymentTypes: [Int])
    
    //MARK: - Shoe Inventory
    func registerTerminalForRemoteNotificationsWithStoreId(storeId: String, sectionId: String, deviceId: String, employeeName: String?, idEmployee: Int, isWarehouse: Bool)
    func createShoesOrder(terminalId: Int, products: [Dictionary<String,AnyObject>])
    func updateShoesOrder(requestId: Int, terminalId: Int,state: Int)
    func getShoesOrders(terminalId: Int, isWarehouse: Bool)
    
    // MARK: - Email
    func sendEmailTo(to: String, to2: String, cc: String, withTitle title: String, message: String, storeType: String, attachment: (fileName: String, mimeType: String, data: NSData)?, withInfo info: [String : Any], completion: @escaping (_ response: WorklightResponse?, _ error: NSError?) -> Void)
    
    // MARK: - SSO
    func ssoTokenIsValid(token: String, systemID: String, userId: String)
    
    // MARK: - GiftRegistry
    func retrieveGiftRegistryTypes(completion: @escaping (_ response: WorklightResponse?, _ error: NSError?) -> Void)
    func retrieveGiftRegistry(eventID: String, completion: @escaping (_ response: WorklightResponse?, _ error: NSError?) -> Void)
    func retrieveGiftRegistryWithApplicationType(eventID: String, appType : Bool, completion: @escaping (_ response: WorklightResponse?, _ error: NSError?) -> Void)
    func searchGiftRegistry(name: String!, lastName: String!, secondLastName: String!, date: String!, type: NSNumber!, gender: String!, completion: @escaping (_ response: WorklightResponse?, _ error: NSError?) -> Void)
    
    
    // MARK: - Shipment
    func createUpdateSOMSShipmentOrderSterling(orderID: String, orderType: String, storeNumber: String, customerFirstName: String, customerLastName: String, senderCustomerFirstName: String, senderCustomerLastName: String, products: [WorklightShippingProduct]?, shippingAdress: WorklightShippingAddress, shipmentID: String, customerID: String, addressID: String, currentStoreInventory: Bool, eventID: String?, senderID: String?, senderAddressID: String?, celebratedType: String?, typeEvent: String, token : String, userId : String, completion: @escaping (WorklightResponse?, NSError?) -> Void)
    func createShipmentOrder(orderID: String, storeNumber: String, customerFirstName: String, customerLastName: String, products: [WorklightShippingProduct]?, shippingAdress: WorklightShippingAddress)
    func createUpdateSOMSShipmentOrder(shipmentID: String, customerID: String, addressID: String, currentStoreInventory: Bool, eventID: String?, senderID: String?, senderAddressID: String?, celebratedType: String?, token : String, userId : String)
    func retrieveRestrictedSKUsForShipping()
    
    // MARK: - CustomerInfo
    func customerAddressByID(customerID: String, neighborhood: String, street: String, completion: @escaping (_ response: WorklightResponse?, _ error: NSError?) -> Void)
    func customerInfoByLada(lada: String, phone: String, name: String, isGiftRegistry: Bool, completion: @escaping (_ response: WorklightResponse?, _ error: NSError?) -> Void)
    
    //MARK: - Order follow-up
    func orderFollowUpGetOrderDetail(orderNumber: String, completion: @escaping (_ response: WorklightResponse?, _ error: NSError?) -> Void)
    func orderFollowUpUpdateDeliveryDate(orderNumber: String, sku: String?, date: String?, comments: String?, token : String, userId : String, completion: @escaping (_ response: WorklightResponse?, _ error: NSError?) -> Void)
    func orderFollowUpScool(orderNumber: String, idRegional: String, completion: @escaping (_ response: WorklightResponse?, _ error: NSError?) -> Void)

    
    //MARK: - Persistent Shopping List

    func createShoppingClient(name: String, email: String?, storeNumber store: String, idVendedor: String, fechaRegistro: String, skuList: [[String : String]], imageStringData: String?, completion: @escaping (WorklightResponse?, NSError?) -> Void)
    func eraseShoppingClient(clientId: String, storeNumber: String)
    func searchShoppingClients(clientName: String, storeNumber: String, idVendedor: String, fechaInicio: String, fechaFin: String, email: String, page: String?, elementsPerPage: String?, completion: @escaping (WorklightResponse?, NSError?) -> Void)
    func searchShoppingClient(clientId: String, storeNumber: String)
    func addShoppingSku(sku: String, storeNumber store: String, clientName: String, id: String, idTipoSku: String, createdAt: String)
    func removeShoppingSku(sku: String, id: String)
    func resetWLStatus()
    
    
    //MARK: - Survey Image request
    func requestSurveyImage(imageName: String, update: Bool)
    
    
    func salesReport(items: AnyObject)
  
    //MARK: - Extended Catalog 
    func isValidToSaleByExtendedCatalog(sku : [String])
    
    //MARK: - Budget
    
    func saveBudget(withInfo info: [String : Any], completion: @escaping (_ response: WorklightResponse?, _ error: NSError?) -> Void)
    
    func searchCCStores(state:String, completion: @escaping (WorklightResponse?, NSError?) -> Void)
    func searchCCStates(completion: @escaping (WorklightResponse?, NSError?) -> Void)
    func getStoreDetail(store:String, completion: @escaping (WorklightResponse?, NSError?) -> Void)
    func createCCOrder(lada: String, phone: String, name: String, userId: String, token: String, products: [WorklightShippingProduct]?, storeNumber:String, storeNumberToSend:String, orderNumber:String, isNewCustomer:Bool, isBigTicketOrder:Bool, email: String?, completion: @escaping (WorklightResponse?, NSError?) -> Void)
}


