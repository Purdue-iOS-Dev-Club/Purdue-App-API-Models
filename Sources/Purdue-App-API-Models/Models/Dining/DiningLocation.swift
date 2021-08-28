//
//  File.swift
//  
//
//  Created by Anderson David on 7/15/21.
//

import Foundation

public struct DiningLocationResponse: Codable {
    public let Location: [DiningLocation?]?
}

public struct DiningLocation: Codable {
    public let Name: String?
    public let Address: Address?
    public let PhoneNumber: String?
    public let Latitude: Float?
    public let Longitude: Float?
    public let ImageUrls: [URL?]?
    public let LogoUrl: URL?
    public let UpcomingMeals: [UpcomingMeal?]?
    // public let NormalHours: [NormalHour?]?
    public let LocationType: LocationType?
    public let Url: URL?
    
    public enum CodingKeys: String, CodingKey {
        case Name
        case Address
        case PhoneNumber
        case Latitude
        case Longitude
        case ImageUrls
        case LogoUrl
        case UpcomingMeals
        // case NormalHours
        case LocationType = "Type"
        case Url
    }
}

public struct UpcomingMeal: Codable {
    public let UpComingMealType: MealType?
    public let StartTime: String?
    public let EndTime: String?
    
    public enum CodingKeys: String, CodingKey {
        case UpComingMealType = "Type"
        case StartTime
        case EndTime
    }
    
    public init(mealType: MealType? = nil, startTime: String? = nil, endTime: String? = nil) {
        self.UpComingMealType = mealType
        self.StartTime = startTime
        self.EndTime = endTime
    }
}

public struct NormalHour: Codable {
    public let Name: String?
    public let EffectiveDate: String?
    public let Days: [NormalHourDay?]?
    
    public init(name: String, effectiveDate: String?, days: [NormalHourDay]) {
        self.Name = name
        self.EffectiveDate = effectiveDate
        self.Days = days
    }
}

public struct NormalHourDay: Codable {
    public let Name: String?
    public let DayOfWeek: Int?
    public let Meals: [NormalHourDayMeal?]?
}

public struct NormalHourDayMeal: Codable {
    public let Name: String?
    public let Order: Int?
    public let Status: String?
    public let Hours: NormalHourDayMealHours?
}

public struct NormalHourDayMealHours: Codable {
    public let StartTime: String?
    public let EndTime: String?
}
