//
//  NSDate.swift
//  CycleSaver
//
//  Created by David Vallas on 3/16/16.
//  Copyright © 2016 Kathryn Killebrew. All rights reserved.
//

import Foundation

extension NSDate {
    
    var double: Double {
        let double: Double = Double(NSDate().timeIntervalSinceDate(self)) * 1000.0
        return double
    }
    
    
    
}