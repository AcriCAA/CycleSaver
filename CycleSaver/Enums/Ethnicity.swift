//
//  Ethnicity.swift
//  CyclePhilly
//
//  Created by David Vallas on 3/2/16.
//  Copyright © 2016 David Vallas. All rights reserved.
//

import Foundation

enum Ethnicity: Int {
    
    case NotDefined = 0
    case Hispanic = 1
    case AmericanIndian = 2
    case Asian = 3
    case Black = 4
    case Hawaiian = 5
    case White = 6
    case Other = 7
    
    static var title: String {
        return "Ethnicity"
    }
    
    var string: String {
        switch self {
        case NotDefined: return "Not Defined"
        case Hispanic: return "Hispanic or Latino"
        case AmericanIndian: return "American Indian or Alaska Native"
        case Asian: return "Asian"
        case Black: return "Black or African American"
        case Hawaiian: return "Native Hawaiian or Other Pacific Islander"
        case White: return "White"
        case Other: return "Other"
        }
    }
}

extension Ethnicity: Encodable {
    
    var encode: AnyObject {
        return self.rawValue
    }
    
    static func decode(object object: AnyObject) -> Ethnicity {
        if let int = object as? Int { return int.ethnicity }
        HGReportHandler.shared.report("object \(object) is not |Ethnicity| decodable, returning .NotDefined", type: .Error)
        return .NotDefined
    }
}