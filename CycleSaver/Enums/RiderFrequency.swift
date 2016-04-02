//
//  RiderFrequency.swift
//  CyclePhilly
//
//  Created by David Vallas on 3/12/16.
//  Copyright © 2016 David Vallas. All rights reserved.
//

import Foundation

enum RiderFrequency: Int {
    
    case NotDefined = 0
    case LessMonth = 1
    case SeveralMonth = 2
    case SeveralWeek = 3
    case Daily = 4
    
    static var title: String {
        return "HOW OFTEN DO YOU RIDE?"
    }
    
    var string: String {
        switch self {
        case NotDefined: return "Not Defined"
        case LessMonth: return "Less than once a month"
        case SeveralMonth: return "Several times per month"
        case SeveralWeek: return "Several times per week"
        case Daily: return "Daily"
        }
    }
}

extension RiderFrequency: Encodable {
    
    var encode: AnyObject {
        return self.rawValue
    }
    
    static func decode(object object: AnyObject) -> RiderFrequency {
        if let int = object as? Int { return int.riderFrequency }
        HGReportHandler.shared.report("object \(object) is not |RiderFrequency| decodable, returning .NotDefined", type: .Error)
        return .NotDefined
    }
}