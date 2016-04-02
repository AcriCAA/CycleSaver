//
//  Trip.swift
//  CyclePhilly
//
//  Created by David Vallas on 3/2/16.
//  Copyright © 2016 David Vallas. All rights reserved.
//

import Foundation

struct Trip {
    
    var name: String
    let start: Double
    let stop: Double
    var distance: Double
    var locations: [Location]
    
    init(name n: String, start sta: Double, stop sto: Double, distance d: Double, locations l: [Location]) {
        name = n
        start = sta
        stop = sto
        distance = d
        locations = l
    }
}

extension Trip: Encodable {
    
    var encode: AnyObject {
        var dict = HGDICT()
        dict["name"] = name
        dict["start"] = start
        dict["stop"] = stop
        dict["distance"] = distance
        dict["locations"] = locations.encode
        return dict
    }
    
    static func decode(object object: AnyObject) -> Trip {
        let dict = hgdict(fromObject: object, decoderName: "Trip")
        let n = dict["name"].string
        let start = dict["start"].double
        let stop = dict["stop"].double
        let d = dict["distance"].double
        let l = dict["locations"].locations
        return Trip(name: n, start: start, stop: stop, distance: d, locations: l)
    }
}

extension Trip {
    
    
    /// starts the trip
    func startTrip() {
    
    }
    
    /// ends trip
    func endTrip() {
    
    }
    
//    /// stores the current trip to file and returns name
//    func storeCurrentTrip() -> String {
//        
//        
//    }
//    
//    /// retrieves trip from file and returns name
//    func retrieveTrip(withName: String) -> Trip? {
//        
//    }
    
}