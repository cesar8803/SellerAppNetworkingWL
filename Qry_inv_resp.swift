
import Foundation
import ObjectMapper

public class Qry_inv_resp : Mappable {
	public var array_obj : [Array_obj]?

	public required init?(map: Map){}

	public func mapping(map: Map) {
		array_obj <- map["array_obj"]
	}
}
