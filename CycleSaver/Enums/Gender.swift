//
//  Gender.swift
//  CyclePhilly
//
//  Created by David Vallas on 3/2/16.
//  Copyright © 2016 David Vallas. All rights reserved.
//

import Foundation

enum Gender: Int {
    
    case NotDefined = 0
    case Male = 1
    case Female = 2
    
    static var title: String {
        return "Gender"
    }
    
    var string: String {
        switch self {
        case .NotDefined: return "Not Defined"
        case Male: return "Male"
        case Female: return "Female"
        }
    }
}

extension Gender: Encodable {
    
    var encode: AnyObject {
        return self.rawValue
    }
    
    static func decode(object object: AnyObject) -> Gender {
        if let int = object as? Int { return int.gender }
        HGReportHandler.shared.report("object \(object) is not |Gender| decodable, returning .NotDefined", type: .Error)
        return .NotDefined
    }
}