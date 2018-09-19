
import Foundation
import ObjectMapper

public class ConsultarFechaEntrega : Mappable {
	public var xmlns : String?
	public var qry_inv_resp : Qry_inv_resp?

    public required init?(map: Map){}

	public func mapping(map: Map) {
		xmlns <- map["xmlns"]
		qry_inv_resp <- map["qry_inv_resp"]
	}

}
