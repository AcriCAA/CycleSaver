//
//  Encodable.swift
//  CycleSaver
//
//  Created by David Vallas on 3/15/16.
//  Copyright © 2016 Kathryn Killebrew. All rights reserved.
//

import Foundation

protocol Encodable {
    var encode: AnyObject { get }
    static func decode(object object: AnyObject) -> Self
}

extension Encodable {
    
    /// decodes an array of objects into an array of [HGEncodable]
    static func decodeArray(objects objects: [AnyObject]) -> [Self] {
        var array: [Self] = []
        for object in objects {
            let decodedObject: Self = decode(object: object)
            array.append(decodedObject)
        }
        return array
    }
}

extension SequenceType where Generator.Element: Encodable {
    
    var encode: [AnyObject] {
        return self.map { $0.encode }
    }
}