//
//  L1Categories.swift
//  WorklightTest
//
//  Created by Luis Cuevas on 20/06/17.
//  Copyright © 2017 Deloitte. All rights reserved.
//

import Foundation
import ObjectMapper

public class L1Categories: Mappable{
    var cat1350731: Cat1350731?
    var cat1250621: Cat1250621?
    var cat5380214: Cat5380214?
    var catst413095: Catst413095?
    var catst392789: Catst392789?
    var cat2119911: Cat2119911?
    var catst418527: Catst418527?
    var cat21010034: Cat21010034?
    var cat21010189: Cat21010189?
    var cat860739: Cat860739?
    var cat5510074: Cat5510074?
    var cat4050000: Cat4050000?
    var cat610025: Cat610025?
    var cat4450237: Cat4450237?
    var cat5300107: Cat5300107?
    var cat1200686: Cat1200686?
    var cat1060780: Cat1060780?
    var cat5010005: Cat5010005?
    var cat5510011: Cat5510011?
    var cat4450173: Cat4450173?
    var cat4980014: Cat4980014?
    var cat5640000: Cat5640000?
    var cat5020003: Cat5020003?
    var cat4470002: Cat4470002?
    var cat1100732: Cat1100732?
    var cat170339: Cat170339?
    var cat4470006: Cat4470006?
    var cat4120003: Cat4120003?
    var cat4990127: Cat4990127?
    var cat1100739: Cat1100739?
    var cat1080656: Cat1080656?
    var cat4990218: Cat4990218?
    var cat4190003: Cat4190003?
    var cat4990318: Cat4990318?
    var cat4190005: Cat4190005?
    var cat4990193: Cat4990193?
    var cat5690007: Cat5690007?
    var cat1200751: Cat1200751?
    var cat1300743: Cat1300743?
    var cat1330604: Cat1330604?
    var cat5190016: Cat5190016?
    var cat5190059: Cat5190059?
    var cat910629: Cat910629?
    var catst378819: Catst378819?
    var cat5380225: Cat5380225?
    var cat1250612: Cat1250612?
    var cat5040494: Cat5040494?
    var cat5630017: Cat5630017?
    var cat4930074: Cat4930074?
    var cat610036: Cat610036?
    var cat850172: Cat850172?
    var cat4190004: Cat4190004?
    var cat4260003: Cat4260003?
    var cat4570008: Cat4570008?
    var cat5440000: Cat5440000?
    var cat4490175: Cat4490175?
    var cat21010228: Cat21010228?
    var cat1200649: Cat1200649?
    var cat5280345: Cat5280345?
    var cat5020010: Cat5020010?
    var cat5660000: Cat5660000?
    var cat480186: Cat480186?
    var cat5020014: Cat5020014?
    var cat910605: Cat910605?
    var cat4990262: Cat4990262?
    var cat910660: Cat910660?
    var cat910740: Cat910740?
    var cat480332: Cat480332?
    var catst394074: Catst394074?
    var cat4370401: Cat4370401?
    var cat4920000: Cat4920000?
    var cat4240006: Cat4240006?
    var cat670055: Cat670055?
    var cat4020016: Cat4020016?
    var cat4990185: Cat4990185?
    var cat3830001: Cat3830001?
    var cat4330033: Cat4330033?
    var catst420836: Catst420836?
    
    required public init?(map: Map){
    }
    public func mapping(map: Map){
        cat1350731 <- map["cat1350731"]
        cat1250621 <- map["cat1250621"]
        cat5380214 <- map["cat5380214"]
        catst413095 <- map["catst413095"]
        catst392789 <- map["catst392789"]
        cat2119911 <- map["cat2119911"]
        catst418527 <- map["catst418527"]
        cat21010034 <- map["cat21010034"]
        cat21010189 <- map["cat21010189"]
        cat860739 <- map["cat860739"]
        cat5510074 <- map["cat5510074"]
        cat4050000 <- map["cat4050000"]
        cat610025 <- map["cat610025"]
        cat4450237 <- map["cat4450237"]
        cat5300107 <- map["cat5300107"]
        cat1200686 <- map["cat1200686"]
        cat1060780 <- map["cat1060780"]
        cat5010005 <- map["cat5010005"]
        cat5510011 <- map["cat5510011"]
        cat4450173 <- map["cat4450173"]
        cat4980014 <- map["cat4980014"]
        cat5640000 <- map["cat5640000"]
        cat5020003 <- map["cat5020003"]
        cat4470002 <- map["cat4470002"]
        cat1100732 <- map["cat1100732"]
        cat170339 <- map["cat170339"]
        cat4470006 <- map["cat4470006"]
        cat4120003 <- map["cat4120003"]
        cat4990127 <- map["cat4990127"]
        cat1100739 <- map["cat1100739"]
        cat1080656 <- map["cat1080656"]
        cat4990218 <- map["cat4990218"]
        cat4190003 <- map["cat4190003"]
        cat4990318 <- map["cat4990318"]
        cat4190005 <- map["cat4190005"]
        cat4990193 <- map["cat4990193"]
        cat5690007 <- map["cat5690007"]
        cat1200751 <- map["cat1200751"]
        cat1300743 <- map["cat1300743"]
        cat1330604 <- map["cat1330604"]
        cat5190016 <- map["cat5190016"]
        cat5190059 <- map["cat5190059"]
        cat910629 <- map["cat910629"]
        catst378819 <- map["catst378819"]
        cat5380225 <- map["cat5380225"]
        cat1250612 <- map["cat1250612"]
        cat5040494 <- map["cat5040494"]
        cat5630017 <- map["cat5630017"]
        cat4930074 <- map["cat4930074"]
        cat610036 <- map["cat610036"]
        cat850172 <- map["cat850172"]
        cat4190004 <- map["cat4190004"]
        cat4260003 <- map["cat4260003"]
        cat4570008 <- map["cat4570008"]
        cat5440000 <- map["cat5440000"]
        cat4490175 <- map["cat4490175"]
        cat21010228 <- map["cat21010228"]
        cat1200649 <- map["cat1200649"]
        cat5280345 <- map["cat5280345"]
        cat5020010 <- map["cat5020010"]
        cat5660000 <- map["cat5660000"]
        cat480186 <- map["cat480186"]
        cat5020014 <- map["cat5020014"]
        cat910605 <- map["cat910605"]
        cat4990262 <- map["cat4990262"]
        cat910660 <- map["cat910660"]
        cat910740 <- map["cat910740"]
        cat480332 <- map["cat480332"]
        catst394074 <- map["catst394074"]
        cat4370401 <- map["cat4370401"]
        cat4920000 <- map["cat4920000"]
        cat4240006 <- map["cat4240006"]
        cat670055 <- map["cat670055"]
        cat4020016 <- map["cat4020016"]
        cat4990185 <- map["cat4990185"]
        cat3830001 <- map["cat3830001"]
        cat4330033 <- map["cat4330033"]
        catst420836 <- map["catst420836"]
    }
}
