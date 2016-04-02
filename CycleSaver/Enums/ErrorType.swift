//
//  ErrorType.swift
//  CycleSaver
//
//  Created by David Vallas on 3/15/16.
//  Copyright © 2016 Kathryn Killebrew. All rights reserved.
//

import Foundation

enum HGErrorType: Int {
    
    case Info = 0
    case Warn = 1
    case Error = 2
    case Alert = 3
    case Assert = 4
    
    var string: String {
        switch self {
        case Info: return "Info"
        case Warn: return "Warn"
        case Error: return "Error"
        case Alert: return "Alert"
        case Assert: return "Assert"
        }
    }
}

extension HGErrorType {
    
    static var new: HGErrorType {
        return HGErrorType.Info
    }
}

extension HGErrorType: Encodable {
    
    var encode: AnyObject {
        return self.rawValue
    }
    
    static func decode(object object: AnyObject) -> HGErrorType {
        if let int = object as? Int { return int.hGErrorType }
        if let string = object as? String { return string.hGErrorType }
        HGReportHandler.shared.report("object \(object) is not |HGErrorType| decodable, returning Info", type: .Error)
        return HGErrorType.new
    }
}
