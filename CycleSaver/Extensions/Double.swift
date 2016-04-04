//
//  Double.swift
//  CycleSaver
//
//  Created by David Vallas on 3/16/16.
//  Copyright © 2016 Kathryn Killebrew. All rights reserved.
//

import Foundation

extension Double {
    
    
    var date: NSDate {
        let time: NSTimeInterval = (self / 1000.0)
        return NSDate(timeIntervalSinceReferenceDate: time)
    }
    
    var string: String {
        return String(self)
    }
    
}