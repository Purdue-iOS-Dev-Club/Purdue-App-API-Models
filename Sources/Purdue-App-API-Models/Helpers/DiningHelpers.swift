//
//  Helpers.swift
//  
//
//  Created by Anderson David on 7/11/21.
//

import Foundation

class DiningHelpers {
    /* Server Side */
    class var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M-d-yyyy"
        return dateFormatter
    }
    
    class var ISO1806DateFormatter: ISO8601DateFormatter {
        let formatter = ISO8601DateFormatter()
        return formatter
    }
    
    class func formatEffectiveDate(effectiveDate: String) -> Date? {
        let purdueTimeZone = TimeZone.init(identifier: "America/New_York")
        var adjustment: String = "-03:00"
        if let timeZone = purdueTimeZone, timeZone.isDaylightSavingTime() {
            adjustment = "-04:00"
        }
        
        return ISO1806DateFormatter.date(from: "\(effectiveDate)\(adjustment)")
    }
    
    static let baseURL: String = "https://api.hfs.purdue.edu/menus/v2"
}
