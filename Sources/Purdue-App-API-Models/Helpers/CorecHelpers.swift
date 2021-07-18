//
//  File.swift
//  
//
//  Created by Anderson David on 7/16/21.
//

import Foundation

public class CorecHelpers {
    class var ISO1806DateFormatter: ISO8601DateFormatter {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [ .withInternetDateTime, .withFractionalSeconds ]
        
        return formatter
    }
    
    class func formatLastUpdatedDateAndTime(lastUpdatedDateAndTime: String) -> Date? {
        let purdueTimeZone = TimeZone.init(identifier: "America/New_York")
        var adjustment: String = "-03:00"
        if let timeZone = purdueTimeZone, timeZone.isDaylightSavingTime() {
            adjustment = "-04:00"
        }
        
        return ISO1806DateFormatter.date(from: "\(lastUpdatedDateAndTime)\(adjustment)")
    }
    
    static let baseURL: String = "https://www.purdue.edu/recwell/data/c2c-api.php"
}
