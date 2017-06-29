//
//  L3CategoryInfo.swift
//  WorklightTest
//
//  Created by Luis Cuevas on 20/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class L3CategoryInfo: Mappable{
    public var catst420869: Catst420869?
    public var catst420864: Catst420864?
    public var catst420865: Catst420865?
    public var catst420884: Catst420884?
    public var catst420893: Catst420893?
    public var catst420842: Catst420842?
    public var catst420876: Catst420876?
    public var catst420857: Catst420857?
    public var catst420845: Catst420845?
    public var catst420846: Catst420846?
    public var catst420847: Catst420847?
    public var catst420853: Catst420853?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        catst420869 <- map["catst420869"]
        catst420864 <- map["catst420864"]
        catst420865 <- map["catst420865"]
        catst420884 <- map["catst420884"]
        catst420893 <- map["catst420893"]
        catst420842 <- map["catst420842"]
        catst420876 <- map["catst420876"]
        catst420857 <- map["catst420857"]
        catst420845 <- map["catst420845"]
        catst420846 <- map["catst420846"]
        catst420847 <- map["catst420847"]
        catst420853 <- map["catst420853"]
    }
}
