//
//  RiderType.swift
//  CyclePhilly
//
//  Created by David Vallas on 3/2/16.
//  Copyright © 2016 David Vallas. All rights reserved.
//

import Foundation

enum RiderType: Int {
    
    case NotDefined = 0
    case Strong = 1
    case Confident = 2
    case Comfortable = 3
    case Concerned = 4
    
    static var title: String {
        return "WHAT KIND OF RIDER ARE YOU?"
    }
    
    var string: String {
        switch self {
        case NotDefined: return "Not Defined"
        case Strong: return "Strong and Fearless"
        case Confident: return "Confident and Enthused"
        case Comfortable: return "Comfortable but Cautious"
        case Concerned: return "Interested but Concerned"
        }
    }
}

extension RiderType: Encodable {
    
    var encode: AnyObject {
        return self.rawValue
    }
    
    static func decode(object object: AnyObject) -> RiderType {
        if let int = object as? Int { return int.riderType }
        HGReportHandler.shared.report("object \(object) is not |RiderType| decodable, returning .NotDefined", type: .Error)
        return .NotDefined
    }
}