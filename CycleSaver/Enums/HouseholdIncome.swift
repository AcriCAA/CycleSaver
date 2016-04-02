//
//  IncomeBracket.swift
//  CyclePhilly
//
//  Created by David Vallas on 3/2/16.
//  Copyright © 2016 David Vallas. All rights reserved.
//

import Foundation

enum HouseholdIncome: Int {
    
    case NotDefined = 0
    case IncomeLess20 = 1
    case Income20_35 = 2
    case Income35_50 = 3
    case Income50_75 = 4
    case Income75_100 = 5
    case Income100_150 = 7
    case Income150_200 = 8
    case IncomeMore200 = 9
    
    var title: String {
        return "Household Income"
    }
    
    var string: String {
        switch self {
        case NotDefined: return "Not Defined"
        case IncomeLess20: return "Less than $20,000"
        case Income20_35: return "$20,000 to $34,999"
        case Income35_50: return "$35,000 to $49,999"
        case Income50_75: return "$50,000 to $74,999"
        case Income75_100: return "$75,000 to $99,999"
        case Income100_150: return "$100,000 to $149,999"
        case Income150_200: return "$150,000 to $199,999"
        case IncomeMore200: return "$200,000 or more"
        }
    }
    
}

extension HouseholdIncome: Encodable {
    
    var encode: AnyObject {
        return self.rawValue
    }
    
    static func decode(object object: AnyObject) -> HouseholdIncome {
        if let int = object as? Int { return int.householdIncome }
        HGReportHandler.shared.report("object \(object) is not |HouseholdIncome| decodable, returning .NotDefined", type: .Error)
        return .NotDefined
    }
}