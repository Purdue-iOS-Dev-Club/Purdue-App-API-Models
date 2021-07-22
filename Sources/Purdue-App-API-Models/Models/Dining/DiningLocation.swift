//
//  File.swift
//  
//
//  Created by Anderson David on 7/15/21.
//

import Foundation

public struct LocationResponse: Codable {
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
    public let NormalHours: [NormalHour?]?
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
        case NormalHours
        case LocationType = "Type"
        case Url
    }
}

public struct UpcomingMeal: Codable {
    public let UpComingMealType: MealType?
    public let StartTime: Date?
    public let EndTime: Date?
    
    public enum CodingKeys: String, CodingKey {
        case UpComingMealType = "Type"
        case StartTime
        case EndTime
    }
    
    public init(mealType: MealType? = nil, startTime: Date? = nil, endTime: Date? = nil) {
        self.UpComingMealType = mealType
        self.StartTime = startTime
        self.EndTime = endTime
    }
}

public extension UpcomingMeal {
    public init(from decoder: Decoder) throws {
        guard let container = try? decoder.container(keyedBy: CodingKeys.self) else {
            self.init()
            return
        }
        
        let UpComingMealType = try? container.decode(MealType.self, forKey: .UpComingMealType)
        
        var StartTime: Date? = nil
        if let StartTimeString = try? container.decode(String.self, forKey: .StartTime) {
            StartTime = DiningHelpers.ISO1806DateFormatter.date(from: StartTimeString)
        }
        
        var EndTime: Date? = nil
        if let EndTimeString = try? container.decode(String.self, forKey: .EndTime) {
            EndTime = DiningHelpers.ISO1806DateFormatter.date(from: EndTimeString)
        }
        
        self.init(mealType: UpComingMealType, startTime: StartTime, endTime: EndTime)
        
    }
}

public struct NormalHour: Codable {
    public let Name: String?
    public let EffectiveDate: Date?
    public let Days: [NormalHourDay?]?
    
    public init(name: String, effectiveDate: Date?, days: [NormalHourDay]) {
        self.Name = name
        self.EffectiveDate = effectiveDate
        self.Days = days
    }
}

public extension NormalHour {
    public init(from decoder: Decoder) throws {
        guard let container = try? decoder.container(keyedBy: CodingKeys.self) else {
            self.init(name: "", effectiveDate: nil, days: [NormalHourDay]())
            return
        }
        
        let Name = try? container.decode(String.self, forKey: .Name)
        
        var EffectiveDate: Date? = nil
        if let EffectiveDateString = try? container.decode(String.self, forKey: .EffectiveDate) {
            EffectiveDate = DiningHelpers.formatEffectiveDate(effectiveDate: EffectiveDateString)
        }
        
        let Days = try? container.decode([NormalHourDay].self, forKey: .Days)
        
        self.init(name: Name ?? "", effectiveDate: EffectiveDate, days: Days ?? [NormalHourDay]())
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
