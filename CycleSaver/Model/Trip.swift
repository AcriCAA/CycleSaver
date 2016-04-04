//
//  Trip.swift
//  CyclePhilly
//
//  Created by David Vallas on 3/2/16.
//  Copyright © 2016 David Vallas. All rights reserved.
//

import Foundation
import MapKit

struct Trip {
    
    var name: String
    let start: Double
    var stop: Double?
    var distance: Double
    var locations: [Location]
    
    init(name n: String, start sta: Double, stop sto: Double?, distance d: Double, locations l: [Location]) {
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
    
    
    /// stores the current trip to file and returns name
    func storeCurrentTrip() {
        let saveName = "Trip_\(start.string)"
        NSUserDefaults.standardUserDefaults().setValue(self.encode, forKey: saveName)
    }
    
    /// retrieves trip from file and returns name
    static func retrieveTrip(withStart s: Double) -> Trip? {
        let saveName = "Trip_\(s.string)"
        let defaults = NSUserDefaults.standardUserDefaults()
        if let object = defaults.objectForKey(saveName) {
            let decoded = Trip.decode(object: object)
            return decoded
        }
        HGReportHandler.shared.report("Open Defaults: Trip with date - \(s) was not found in user defaults, returning nil", type: .Info)
        return nil
    }
}


extension Trip {
    
    /// returns the iterated name, iterated if another object in array already had value
    func iterated(forArray array: [TripInfo]) -> String {
        let names = array.map { $0.name }
        if names.contains(self.name) {
            let iterationNum = array.count + 1
            return self.name + "\(iterationNum)"
        }
        return self.name
    }
    
    var tripInfo: TripInfo {
        return TripInfo(name: self.name, uploaded: false, start: self.start, stop: self.stop, distance: self.distance)
    }
}