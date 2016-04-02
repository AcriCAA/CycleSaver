//
//  Optional.swift
//  CycleSaver
//
//  Created by David Vallas on 4/1/16.
//  Copyright © 2016 Kathryn Killebrew. All rights reserved.
//

import Foundation

extension Optional {
    
    var bool: Bool {
        if let bool = self as? Bool { return bool }
        HGReportHandler.shared.report("Unable to unwrap Bool for |\(self)|, returning false", type: .Error)
        return false
    }
    
    var int: Int {
        if let int = self as? Int { return int }
        HGReportHandler.shared.report("Unable to unwrap Int for |\(self)|, returning 0", type: .Error)
        return 0
    }
    
    var double: Double {
        if let double = self as? Double { return double }
        HGReportHandler.shared.report("Unable to unwrap Double for |\(self)|, returning 0.0", type: .Error)
        return 0.0
    }
    
    var string: String {
        if let string = self as? String { return string }
        HGReportHandler.shared.report("Unable to unwrap String for |\(self)|, returning |Not Decoded Properly|", type: .Error)
        return "|Not Decoded Properly|"
    }
    
    var locations: [Location] {
        if let dict = self as? HGDICT { let location = Location.decode(object: dict); return [location] }
        if let array = self as? [HGDICT] { return Location.decodeArray(objects: array) }
        HGReportHandler.shared.report("Unable to unwrap Location array for |\(self)|, returning []", type: .Error)
        return []
    }
    
    var tripInfos: [TripInfo] {
        if let dict = self as? HGDICT { let location = TripInfo.decode(object: dict); return [location] }
        if let array = self as? [HGDICT] { return TripInfo.decodeArray(objects: array) }
        HGReportHandler.shared.report("Unable to unwrap TripInfo array for |\(self)|, returning []", type: .Error)
        return []
    }
    
    var userInfo: UserInfo {
        if let dict = self as? HGDICT { return UserInfo.decode(object: dict) }
        HGReportHandler.shared.report("Unable to unwrap UserInfo for |\(self)|, returning nil", type: .Warn)
        return UserInfo.new
    }
    
    var optionalTrip: Trip? {
        if let dict = self as? HGDICT { return Trip.decode(object: dict) }
        HGReportHandler.shared.report("Unable to unwrap Trip for |\(self)|, returning nil", type: .Warn)
        return nil
    }
    
    var ethnicity: Ethnicity {
        if let int = self as? Int { return Ethnicity.decode(object: int) }
        HGReportHandler.shared.report("Unable to unwrap Ethnicity for |\(self)|, returning .NotDefined", type: .Error)
        return .NotDefined
    }
    
    var gender: Gender {
        if let int = self as? Int { return Gender.decode(object: int) }
        HGReportHandler.shared.report("Unable to unwrap Gender for |\(self)|, returning .NotDefined", type: .Error)
        return .NotDefined
    }
    
    var householdIncome: HouseholdIncome {
        if let int = self as? Int { return HouseholdIncome.decode(object: int) }
        HGReportHandler.shared.report("Unable to unwrap HouseholdIncome for |\(self)|, returning .NotDefined", type: .Error)
        return .NotDefined
    }
    
    var riderDuration: RiderDuration {
        if let int = self as? Int { return RiderDuration.decode(object: int) }
        HGReportHandler.shared.report("Unable to unwrap RiderDuration for |\(self)|, returning .NotDefined", type: .Error)
        return .NotDefined
    }
    
    var riderFrequency: RiderFrequency {
        if let int = self as? Int { return RiderFrequency.decode(object: int) }
        HGReportHandler.shared.report("Unable to unwrap RiderFrequency for |\(self)|, returning .NotDefined", type: .Error)
        return .NotDefined
    }
    
    var riderType: RiderType {
        if let int = self as? Int { return RiderType.decode(object: int) }
        HGReportHandler.shared.report("Unable to unwrap RiderType for |\(self)|, returning .NotDefined", type: .Error)
        return .NotDefined
    }
    
}