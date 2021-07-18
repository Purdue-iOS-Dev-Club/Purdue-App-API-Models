//
//  File.swift
//  
//
//  Created by Anderson David on 7/15/21.
//

import Foundation

enum MealType: String, Codable {
    case Breakfast
    case Lunch
    case LateLunch = "Late Lunch"
    case Snack
    case Dinner
}

public enum LocationName: String, Codable {
    case OneBowl = "1Bowl"
    case AllAmericanDiningRoom = "All American Dining Room"
    case Earhart
    case EarhartOnTheGo = "Earhart On-the-GO!"
    case Ford
    case FordOnTheGo = "Ford On-the-GO!"
    case Hillenbrand
    case LawsonOnTheGo = "Lawson On-the-GO!"
    case PetesZa = "Pete's Za"
    case TheGatheringPlace = "The Gathering Place"
    case Wiley
    case Windsor
    case WindsorOnTheGo = "Windsor On-the-GO!"
}

enum LocationType: String, Codable {
    case DiningCourt = "Dining Courts"
    case QuickBite = "Quick Bites"
    case OnTheGo = "On-the-GO!"
}

enum DiningError: Error {
    case parsingError
    case unknownError
}
