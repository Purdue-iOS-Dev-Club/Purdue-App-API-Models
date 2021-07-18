//
//  File.swift
//  
//
//  Created by Anderson David on 7/16/21.
//

import Foundation

public struct CorecLocation: Codable, Hashable {
    public let LocationId: Int?
    public let LocationName: String?
    public let TotalCapacity: Int?
    public let LastCount: Int?
    public let LastUpdatedDateAndTime: Date?
    
    public init(locationId: Int?, locationName: String?, totalCapacity: Int?, lastCount: Int?, lastUpdatedDateAndTime: Date?) {
        self.LocationId = locationId
        self.LocationName = locationName
        self.TotalCapacity = totalCapacity
        self.LastCount = lastCount
        self.LastUpdatedDateAndTime = lastUpdatedDateAndTime
    }
}

public extension CorecLocation {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let LocationId = try? container.decode(Int.self, forKey: .LocationId)
        let LocationName = try? container.decode(String.self, forKey: .LocationName)
        let TotalCapacity = try? container.decode(Int.self, forKey: .TotalCapacity)
        let LastCount = try? container.decode(Int.self, forKey: .LastCount)
        
        var LastUpdatedDateAndTime: Date? = nil
        if let LastUpdatedDateAndTimeString = try? container.decode(String.self, forKey: .LastUpdatedDateAndTime) {
            LastUpdatedDateAndTime = CorecHelpers.formatLastUpdatedDateAndTime(lastUpdatedDateAndTime: LastUpdatedDateAndTimeString)
        }
        
        self.init(locationId: LocationId, locationName: LocationName, totalCapacity: TotalCapacity, lastCount: LastCount, lastUpdatedDateAndTime: LastUpdatedDateAndTime)
    }
}
