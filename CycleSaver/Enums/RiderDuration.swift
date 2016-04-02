//
//  RiderDuration.swift
//  CyclePhilly
//
//  Created by David Vallas on 3/2/16.
//  Copyright © 2016 David Vallas. All rights reserved.
//

import Foundation

enum RiderDuration: Int {
    
    case NotDefined = 0
    case Childhood = 1
    case Years = 2
    case OneYear = 3
    case JustStarted = 4
    
    static var title: String {
        return "HOW LONG HAVE YOU BEEN A CYCLIST?"
    }
    
    var string: String {
        switch self {
        case NotDefined: return "Not Defined"
        case Childhood: return "Since Childhood"
        case Years: return "Several Years"
        case OneYear: return "One Year or Less"
        case .JustStarted: return "Just Started"
        }
    }
}

extension RiderDuration: Encodable {
    
    var encode: AnyObject {
        return self.rawValue
    }
    
    static func decode(object object: AnyObject) -> RiderDuration {
        if let int = object as? Int { return int.riderDuration }
        HGReportHandler.shared.report("object \(object) is not |RiderDuration| decodable, returning .NotDefined", type: .Error)
        return .NotDefined
    }
}