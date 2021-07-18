//
//  APIModels.swift
//  NutritionCalc
//
//  Created by Anderson David on 3/25/19.
//  Copyright © 2019 Anderson David. All rights reserved.
//

import Foundation

public struct DiningCourt: Codable {

    public let Location:LocationName
    public let Date:String
    public let Meals:[Meal]
    
}

public struct Meal: Codable {
    
    public let Name:MealType
    public let Stations:[Station]
    
}

public struct Station: Codable {
    
    public let Name:String
    public let Items:[Item]
    
}

public struct Item: Codable {
    
    public let ID:String
    public let Name:String
    
}

public struct ItemDetail: Codable {
    
    public let ID:String
    public let Name: String
    public let Nutrition: [NutritionItem]
    public let Ingredients: String
    public let Allergens: [Allergen]
    
}

public struct Allergen: Codable {
    
    public let Name: String?
    public let Value: Bool?
}

public struct NutritionItem: Codable {
    
    public let Name: String?
    public let LabelValue: String?
    public let Value: Float?
    public let DailyValue: String?
    public let Ordinal: Int?

}
