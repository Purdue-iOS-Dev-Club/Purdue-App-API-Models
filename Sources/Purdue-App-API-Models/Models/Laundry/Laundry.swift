//
//  File.swift
//  
//
//  Created by Anderson David on 8/17/21.
//

import Foundation

struct LaundryRoom: Codable {
    let name: String
    let id: String

    enum CodingKeys: String, CodingKey {
        case name = "laundryName"
        case id = "laundryId"
    }
}

struct LaundryMachine: Encodable {
    let name: String
    let type: LaundryType
    let status: LaundryStatus
    let time: String?
    let room: LaundryRoom

    enum CodingKeys: String, CodingKey {
        case name
        case type
        case status
        case time
        case room
    }
}

extension LaundryMachine {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let name = try container.decode(String.self, forKey: .name)
        let statusString = try container.decode(String.self, forKey: .status)
        let status = LaundryStatus(rawValue: statusString)
        let type = try container.decode(LaundryType.self, forKey: .type)
        let time = try container.decodeIfPresent(String.self, forKey: .time)
        let room = try container.decode(LaundryRoom.self, forKey: .room)

        self.init(name: name, type: type, status: status ?? .other, time: time, room: room)
    }
}

enum LaundryType: String, Codable {
    case washer = "Washer"
    case dryer = "Dryer"
}

enum LaundryStatus: String, Codable {
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
