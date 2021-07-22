//
//  File.swift
//  
//
//  Created by Anderson David on 7/21/21.
//

import Foundation

public struct RetailLocationResponse: Codable {
    public let Location: [RetailLocation?]?
}

public struct RetailLocation: Codable {
    public let Name: String?
    public let Address: Address?
    public let PhoneNumber: String?
    public let Latitude: Float?
    public let Longitude: Float?
    public let LocationType: LocationType?
    public let LogoUrl: URL?
    public let MenuUrl: URL?
    public let Description: String?
    public let Url: URL?
    public let BannerUrl: URL?
    
    public enum CodingKeys: String, CodingKey {
        case Name
        case Address
        case PhoneNumber
        case Latitude
        case Longitude
        case LocationType = "Type"
        case LogoUrl
        case MenuUrl
        case Description
        case Url
        case BannerUrl
    }
}
