//
//  UserInfo.swift
//  CyclePhilly
//
//  Created by David Vallas on 3/2/16.
//  Copyright © 2016 David Vallas. All rights reserved.
//

import Foundation

struct UserInfo {
    
    let age: Int
    let email: String
    let gender: Gender
    let ethnicity: Ethnicity
    let householdIncome: HouseholdIncome
    let riderType: RiderType
    let riderFrequency: RiderFrequency
    let riderDuration: RiderDuration
    
    init(age a: Int, email e: String, gender g: Gender, ethnicity eth: Ethnicity, householdIncome h: HouseholdIncome, riderType rt: RiderType, riderFrequency rf: RiderFrequency, riderDuration rd: RiderDuration) {
        age = a
        email = e
        gender = g
        ethnicity = eth
        householdIncome = h
        riderType = rt
        riderFrequency = rf
        riderDuration = rd
    }
}

extension UserInfo {
    
    /// returns a new userInfo variable
    static var new: UserInfo {
        return UserInfo(age: 0, email: "", gender: .NotDefined, ethnicity: .NotDefined, householdIncome: .NotDefined, riderType: .NotDefined, riderFrequency: .NotDefined, riderDuration: .NotDefined)
    }
    
}

extension UserInfo: Encodable {
    
    var encode: AnyObject {
        var dict = HGDICT()
        dict["age"] = age
        dict["email"] = email
        dict["gender"] = gender.encode
        dict["ethnicity"] = ethnicity.encode
        dict["householdIncome"] = householdIncome.encode
        dict["riderType"] = riderType.encode
        dict["riderFrequency"] = riderFrequency.encode
        dict["riderDuration"] = riderDuration.encode
        return dict
    }
    
    static func decode(object object: AnyObject) -> UserInfo {
        let dict = hgdict(fromObject: object, decoderName: "UserInfo")
        let a = dict["age"].int
        let e = dict["email"].string
        let g = dict["gender"].gender
        let eth = dict["ethnicity"].ethnicity
        let h = dict["householdIncome"].householdIncome
        let rt = dict["riderType"].riderType
        let rf = dict["riderFrequency"].riderFrequency
        let rd = dict["riderDuration"].riderDuration
        return UserInfo(age: a, email: e, gender: g, ethnicity: eth, householdIncome: h, riderType: rt, riderFrequency: rf, riderDuration: rd)
    }
}
