//
//  CyclePhillyStore.swift
//  CyclePhilly
//
//  Created by David Vallas on 3/14/16.
//  Copyright © 2016 David Vallas. All rights reserved.
//

import Foundation

final class CPStore {
    
    let name: String
    var userInfo: UserInfo
    var currentTrip: Trip?
    var tripInfos: [TripInfo] = []
    
    init(name n: String) {
        name = n
        userInfo = UserInfo.new
        tripInfos = []
    }
    
    init (name n: String, userInfo u: UserInfo, currentTrip ct: Trip?, tripInfos ti: [TripInfo]) {
        name = n
        userInfo = u
        currentTrip = ct
        tripInfos = ti
    }
}


extension CPStore: Encodable {
    
    var encode: AnyObject {
        var dict = HGDICT()
        dict["name"] = name
        dict["userInfo"] = userInfo.encode
        dict["currentTrip"] =? currentTrip?.encode
        dict["tripInfos"] = tripInfos.encode
        return dict
    }
    
    static func decode(object object: AnyObject) -> CPStore {
        let dict = hgdict(fromObject: object, decoderName: "CPStore")
        let n = dict["name"].string
        let u = dict["userInfo"].userInfo
        let ct = dict["currentTrip"].optionalTrip
        let ti = dict["tripInfos"].tripInfos
        return CPStore(name: n, userInfo: u, currentTrip: ct, tripInfos: ti)
    }
}