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
    public let LocationAddress: Address?
    public let PhoneNumber: String?
    public let Latitude: Float?
    public let Longitude: Float?
    public let RetailLocationType: LocationType?
    public let LogoUrl: URL?
    public let MenuUrl: URL?
    public let Description: String?
    public let Url: URL?
    public let BannerUrl: URL?
    
    public enum CodingKeys: String, CodingKey {
        case Name
        case LocationAddress = "Address"
        case PhoneNumber
        case Latitude
        case Longitude
        case RetailLocationType = "Type"
        case LogoUrl
        case MenuUrl
        case Description
        case Url
        case BannerUrl
    }
    
    public init(name: String?, address: Address?, phoneNum: String?, latitude: Float?, longitude: Float?, locationType: LocationType?, logoUrl: URL?, menuUrl: URL?, description: String?, url: URL?, bannerUrl: URL?) {
        self.Name = name
        self.LocationAddress = address
        self.PhoneNumber = phoneNum
        self.Latitude = latitude
        self.Longitude = longitude
        self.RetailLocationType = locationType
        self.LogoUrl = logoUrl
        self.MenuUrl = menuUrl
        self.Description = description
        self.Url = url
        self.BannerUrl = bannerUrl
    }
    
    public init(from decoder: Decoder) throws {
        guard let container = try? decoder.container(keyedBy: CodingKeys.self) else {
            print("Bad container")
            throw DiningError.unknownError
        }
        
        print("Trying to get name")
        let name = try container.decode(String.self, forKey: .Name)
        print("Trying to get address")
        let address = try container.decode(Address.self, forKey: .LocationAddress)
        print("Trying to get phone")
        let phoneNum = try container.decode(String.self, forKey: .PhoneNumber)
        print("Trying to get lat")
        let latitude = try container.decode(Float.self, forKey: .Latitude)
        print("Trying to get long")
        let longitude = try container.decode(Float.self, forKey: .Longitude)
        print("Trying to get locType")
        let locationType = try container.decode(LocationType.self, forKey: .RetailLocationType)
        print("Trying to get logo")
        let logoUrl = try container.decode(URL.self, forKey: .LogoUrl)
        print("Trying to get menu")
        let menuUrl = try container.decode(URL.self, forKey: .MenuUrl)
        print("Trying to get desc")
        let description = try container.decode(String.self, forKey: .Description)
        print("Trying to get url")
        let url = try container.decode(URL.self, forKey: .Url)
        print("Trying to get banner")
        let bannerUrl = try container.decode(URL.self, forKey: .BannerUrl)
        
        self.init(name: name, address: address, phoneNum: phoneNum, latitude: latitude, longitude: longitude, locationType: locationType, logoUrl: logoUrl, menuUrl: menuUrl, description: description, url: url, bannerUrl: bannerUrl)
        print(self)
    }
}
