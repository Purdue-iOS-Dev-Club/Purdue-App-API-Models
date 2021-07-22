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
        
        let name = try? container.decode(String.self, forKey: .Name)
        let address = try? container.decode(Address.self, forKey: .LocationAddress)
        let phoneNum = try? container.decode(String.self, forKey: .PhoneNumber)
        let latitude = try? container.decode(Float.self, forKey: .Latitude)
        let longitude = try? container.decode(Float.self, forKey: .Longitude)
        let locationType = try? container.decode(LocationType.self, forKey: .RetailLocationType)
        let logoUrl = try? container.decode(URL.self, forKey: .LogoUrl)
        let menuUrl = try? container.decode(URL.self, forKey: .MenuUrl)
        let description = try? container.decode(String.self, forKey: .Description)
        let url = try? container.decode(URL.self, forKey: .Url)
        let bannerUrl = try? container.decode(URL.self, forKey: .BannerUrl)
        
        self.init(name: name, address: nil, phoneNum: phoneNum, latitude: latitude, longitude: longitude, locationType: nil, logoUrl: logoUrl, menuUrl: menuUrl, description: description, url: url, bannerUrl: bannerUrl)
        print(self)
    }
}
