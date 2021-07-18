//
//  APIModels.swift
//  NutritionCalc
//
//  Created by Anderson David on 3/25/19.
//  Copyright © 2019 Anderson David. All rights reserved.
//

import Foundation

struct DiningCourt: Codable {

    let Location:LocationName
    let Date:String
    let Meals:[Meal]
    
}

struct Meal: Codable {
    
    let Name:MealType
    let Stations:[Station]
    
}

struct Station: Codable {
    
    let Name:String
    let Items:[Item]
    
}

struct Item: Codable {
    
    let ID:String
    let Name:String
    
}

struct ItemDetail: Codable {
    
    let ID:String
    let Name: String
    let Nutrition: [NutritionItem]
    let Ingredients: String
    let Allergens: [Allergen]
    
}

struct Allergen: Codable {
    
    let Name: String?
    let Value: Bool?
}

struct NutritionItem: Codable {
    
    let Name: String?
    let LabelValue: String?
    let Value: Float?
    let DailyValue: String?
    let Ordinal: Int?

}
