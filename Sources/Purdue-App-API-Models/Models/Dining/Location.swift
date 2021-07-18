//
//  File.swift
//  
//
//  Created by Anderson David on 7/15/21.
//

import Foundation

struct LocationResponse: Codable {
    let Location: [Location?]?
}

struct Location: Codable {
    let Name: LocationName?
    let Address: Address?
    let PhoneNumber: String?
    let Latitude: Float?
    let Longitude: Float?
    let ImageUrls: [URL?]?
    let LogoUrl: URL?
    let UpcomingMeals: [UpcomingMeal?]?
    let NormalHours: [NormalHour?]?
    let LocationType: LocationType?
    let Url: URL?
    
    enum CodingKeys: String, CodingKey {
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

struct Address: Codable {
    let Street: String?
    let City: String?
    let State: String?
    let ZipCode: String?
}

struct UpcomingMeal: Codable {
    let UpComingMealType: MealType?
    let StartTime: Date?
    let EndTime: Date?
    
    enum CodingKeys: String, CodingKey {
        case UpComingMealType = "Type"
        case StartTime
        case EndTime
    }
    
    init(mealType: MealType? = nil, startTime: Date? = nil, endTime: Date? = nil) {
        self.UpComingMealType = mealType
        self.StartTime = startTime
        self.EndTime = endTime
    }
}

extension UpcomingMeal {
    init(from decoder: Decoder) throws {
        guard let container = try? decoder.container(keyedBy: CodingKeys.self) else {
            self.init()
            return
        }
        
        let MealTypeString = try? container.decode(String.self, forKey: .UpComingMealType)
        let MealType = MealType(rawValue: MealTypeString ?? "")
        
        var StartTime: Date? = nil
        if let StartTimeString = try? container.decode(String.self, forKey: .StartTime) {
            StartTime = DiningHelpers.ISO1806DateFormatter.date(from: StartTimeString)
        }
        
        var EndTime: Date? = nil
        if let EndTimeString = try? container.decode(String.self, forKey: .EndTime) {
            EndTime = DiningHelpers.ISO1806DateFormatter.date(from: EndTimeString)
        }
        
        self.init(mealType: MealType, startTime: StartTime, endTime: EndTime)
        
    }
}

struct NormalHour: Codable {
    let Name: String?
    let EffectiveDate: Date?
    let Days: [NormalHourDay?]?
    
    init(name: String, effectiveDate: Date?, days: [NormalHourDay]) {
        self.Name = name
        self.EffectiveDate = effectiveDate
        self.Days = days
    }
}

extension NormalHour {
    init(from decoder: Decoder) throws {
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

struct NormalHourDay: Codable {
    let Name: String?
    let DayOfWeek: Int?
    let Meals: [NormalHourDayMeal?]?
}

struct NormalHourDayMeal: Codable {
    let Name: String?
    let Order: Int?
    let Status: String?
    let Hours: NormalHourDayMealHours?
}

struct NormalHourDayMealHours: Codable {
    let StartTime: String?
    let EndTime: String?
}
