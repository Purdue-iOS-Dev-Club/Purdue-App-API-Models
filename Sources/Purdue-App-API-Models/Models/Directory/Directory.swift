//
//  File.swift
//  
//
//  Created by Anderson David on 8/17/21.
//

import Foundation

public struct DirectoryResult: Codable {
    public var name: String
    public var alias: String
    public var campus: String
    public var school: String
    public var qualifiedName: String
    public var email: String
    
    public init(name: String = "", alias: String = "", campus: String = "", school: String = "", qualifiedName: String = "", email: String = "") {
        self.name = name
        self.alias = alias
        self.campus = campus
        self.school = school
        self.qualifiedName = qualifiedName
        self.email = email
    }
}
