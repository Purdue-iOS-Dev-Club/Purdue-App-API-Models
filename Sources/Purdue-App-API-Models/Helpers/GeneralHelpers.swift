//
//  File.swift
//  
//
//  Created by Anderson David on 7/17/21.
//

import Foundation

public class GeneralHelpers {
    /* Client Side */
    public class func convertServerDate(serverReturnedDate: Double) -> Date {
        return Date(timeIntervalSinceReferenceDate: serverReturnedDate)
    }
}
