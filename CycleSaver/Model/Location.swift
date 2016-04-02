//
//  Location.swift
//  CyclePhilly
//
//  Created by David Vallas on 3/2/16.
//  Copyright © 2016 David Vallas. All rights reserved.
//

import Foundation

struct Location {
    
    let latitude: Double
    let longitude: Double
    let altitude: Double
    let speed: Double
    let horizontalAccuracy: Double
    let timeStamp: Double
    
    init(latitude la: Double, longitude lo: Double, altitude al: Double, speed s: Double, horizontalAccuracy ha: Double) {
        latitude = la
        longitude = lo
        altitude = al
        speed = s
        horizontalAccuracy = ha
        timeStamp = NSDate().double
    }
    
    init(latitude la: Double, longitude lo: Double, altitude al: Double, speed s: Double, horizontalAccuracy ha: Double, timestamp t: Double) {
        latitude = la
        longitude = lo
        altitude = al
        speed = s
        horizontalAccuracy = ha
        timeStamp = t
    }
}

extension Location: Encodable {
    
    var encode: AnyObject {
        var dict = HGDICT()
        dict["latitude"] = latitude
        dict["longitude"] = longitude
        dict["altitude"] = altitude
        dict["speed"] = speed
        dict["horizontalAccuracy"] = horizontalAccuracy
        dict["timeStamp"] = timeStamp
        return dict
    }
    
    static func decode(object object: AnyObject) -> Location {
        let dict = hgdict(fromObject: object, decoderName: "Location")
        let la = dict["latitude"].double
        let lo = dict["longitude"].double
        let a = dict["altitude"].double
        let s = dict["speed"].double
        let ha = dict["horizontalAccuracy"].double
        let t = dict["timeStamp"].double
        return Location(latitude: la, longitude: lo, altitude: a, speed: s, horizontalAccuracy: ha, timestamp: t)
    }
}