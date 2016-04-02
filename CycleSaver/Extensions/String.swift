//
//  Int.swift
//  CyclePhilly
//
//  Created by David Vallas on 3/14/16.
//  Copyright © 2016 David Vallas. All rights reserved.
//

import Foundation

extension String {
    
    func isZip() -> Bool {
        if self.characters.count != 5 { return false }
        let num = Int(self)
        if num > 1 && num < 99999 { return true }
        return false
    }
    
    var hGErrorType: HGErrorType {
        
        switch self {
        case "Info": return .Info
        case "Warn": return .Warn
        case "Error": return .Error
        case "Alert": return .Alert
        case "Assert": return .Assert
        default:
            HGReportHandler.shared.report("string \(self) is not |HGErrorType| decodable, returning Info", type: .Error)
        }
        
        return .Info
    }
    
}