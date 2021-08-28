//
//  File.swift
//  
//
//  Created by Anderson David on 8/17/21.
//

import Foundation

#if canImport(UIKit)
import UIKit
#endif


public struct LaundryResponse: Codable {
    public var status: String
    public var rooms: [LaundryRoom]
    
    public init(status: String = "", rooms: [LaundryRoom] = []) {
        self.status = status
        self.rooms = rooms
    }
}

public struct LaundryRoom: Codable {
    public var name: String
    public var machines: [LaundryMachine]
    
    public enum CodingKeys: String, CodingKey {
        case name = "laundryName"
        case machines
    }
    
    public init(name: String = "", machines: [LaundryMachine] = []) {
        self.name = name
        self.machines = machines
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
    
    public init(name: String = "", type: LaundryType = LaundryType.washer, status: LaundryStatus = LaundryStatus.other, time: String? = nil) {
        self.name = name
        self.type = type
        self.status = status
        self.time = time
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
    
    #if canImport(UIKit)
    public var textColor: UIColor {
        switch self {
        case .available:
            return UIColor(red: 0.086, green: 0.627, blue: 0.522, alpha: 1)
        case .inUse:
            return UIColor.red
        case .endOfCycle:
            return UIColor(red: 0.153, green: 0.682, blue: 0.376, alpha: 1)
        case .almost:
            return UIColor(red: 0.945, green: 0.769, blue: 0.059, alpha: 1)
        case .ready, .paymentInProgress:
            return UIColor(red: 0.902, green: 0.494, blue: 0.133, alpha: 1)
        case .notOnline, .outOfOrder:
            return UIColor(red: 0.204, green: 0.596, blue: 0.859, alpha: 1)
        case .other:
            return UIColor.black
        }
    }
    #endif
}
