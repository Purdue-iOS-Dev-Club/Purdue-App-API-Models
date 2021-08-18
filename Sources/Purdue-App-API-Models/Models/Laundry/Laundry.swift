//
//  File.swift
//  
//
//  Created by Anderson David on 8/17/21.
//

import Foundation

public struct LaundryResponse: Codable {
    public var status: String
    public var rooms: [LaundryRoom]
}

public struct LaundryRoom: Codable {
    public var name: String
    public var machines: [LaundryMachine]
    
    public enum CodingKeys: String, CodingKey {
        case name = "laundryName"
        case machines
    }
}

public struct LaundryMachine: Codable {
    public var name: String
    public var type: LaundryType
    public var status: LaundryStatus
    public var time: String?

    public enum CodingKeys: String, CodingKey {
        case name
        case type
        case status
        case time
    }
}

public extension LaundryMachine {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let name = try container.decode(String.self, forKey: .name)
        let statusString = try container.decode(String.self, forKey: .status)
        let status = LaundryStatus(rawValue: statusString)
        let type = try container.decode(LaundryType.self, forKey: .type)
        let time = try container.decodeIfPresent(String.self, forKey: .time)

        self.init(name: name, type: type, status: status ?? .other, time: time)
    }
}

public enum LaundryType: String, Codable {
    case washer = "Washer"
    case dryer = "Dryer"
}

public enum LaundryStatus: String, Codable {
    case available = "Available"
    case inUse = "In use"
    case endOfCycle = "End of cycle"
    case almost = "Almost done"
    case ready = "Ready to start"
    case paymentInProgress = "Payment in progress"
    case notOnline = "Not online"
    case outOfOrder = "Out of order"
    case other
}
