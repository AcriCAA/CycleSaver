//
//  TripInfo.swift
//  CycleSaver
//
//  Created by David Vallas on 4/1/16.
//  Copyright © 2016 Kathryn Killebrew. All rights reserved.
//

import Foundation

struct TripInfo {
    var name: String
    var uploaded: Bool
    let startTime: Double
    let endTime: Double
    let distance: Double
    
    init(name n: String, uploaded u: Bool, startTime s: Double, endTime e: Double, distance d: Double) {
        name = n
        uploaded = u
        startTime = s
        endTime = e
        distance = d
    }
}

extension TripInfo: Encodable {
    
    var encode: AnyObject {
        var dict = HGDICT()
        dict["name"] = name
        dict["uploaded"] = uploaded
        dict["startTime"] = startTime
        dict["endTime"] = endTime
        dict["distance"] = distance
        return dict
    }
    
    static func decode(object object: AnyObject) -> TripInfo {
        let dict = hgdict(fromObject: object, decoderName: "Trip")
        let n = dict["name"].string
        let u = dict["uploaded"].bool
        let s = dict["startTime"].double
        let e = dict["endTime"].double
        let d = dict["distance"].double
        return TripInfo(name: n, uploaded: u, startTime: s, endTime: e, distance: d)
    }
}