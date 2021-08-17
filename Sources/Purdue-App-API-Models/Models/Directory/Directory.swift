//
//  File.swift
//  
//
//  Created by Anderson David on 8/17/21.
//

import Foundation

public struct DirectoryResult: Codable {
    public let name: String
    public let alias: String
    public let campus: String
    public let school: String
    public let qualifiedName: String
    public let email: String
    
    public init(name: String = "", alias: String = "", campus: String = "", school: String = "", qualifiedName: String = "", email: String = "") {
        self.name = name
        self.alias = alias
        self.campus = campus
        self.school = school
        self.qualifiedName = qualifiedName
        self.email = email
    }
}
