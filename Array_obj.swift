
import Foundation
import ObjectMapper

public class Array_obj : Mappable {
	public var error_code : String?
	public var edd1 : String?
	public var edd2 : String?
	public var skuid : String?

	public required init?(map: Map) {}

	public func mapping(map: Map) {

		error_code <- map["error_code"]
		edd1 <- map["edd1"]
		edd2 <- map["edd2"]
		skuid <- map["skuid"]
	}

}
