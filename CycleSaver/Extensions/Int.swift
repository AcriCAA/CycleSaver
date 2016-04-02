//
//  Int.swift
//  CycleSaver
//
//  Created by David Vallas on 3/15/16.
//  Copyright © 2016 Kathryn Killebrew. All rights reserved.
//

import Foundation

extension Int {
    
    /// returns HGErrorTypes.  Logs error and returns Info if not a valid Int.
    var hGErrorType: HGErrorType {
        switch self {
        case 0: return .Info
        case 1: return .Warn
        case 2: return .Error
        case 3: return .Alert
        case 4: return .Assert
        default:
            HGReportHandler.shared.report("int: |\(self)| is not enum |HGErrorType| mapable, using Info", type: .Error)
        }
        return .Info
    }
    
    /// returns Ethnicity.  Logs error and returns NotDefined if not a valid Int.
    var ethnicity: Ethnicity {
        
        switch self {
        case 0: return .NotDefined
        case 1: return .Hispanic
        case 2: return .AmericanIndian
        case 3: return .Asian
        case 4: return .Black
        case 5: return .Hawaiian
        case 6: return .White
        case 7: return .Other
        default:
            HGReportHandler.shared.report("int: |\(self)| is not enum |Ethnicity| mapable, using NotDefined", type: .Error)
        }
        return .NotDefined
    }
    
    /// returns Gender.  Logs error and returns NotDefined if not a valid Int.
    var gender: Gender {
        
        switch self {
        case 0: return .NotDefined
        case 1: return .Male
        case 2: return .Female
        default:
            HGReportHandler.shared.report("int: |\(self)| is not enum |Gender| mapable, using NotDefined", type: .Error)
        }
        return .NotDefined
    }
    
    /// returns HouseholdIncome.  Logs error and returns NotDefined if not a valid Int.
    var householdIncome: HouseholdIncome {
        
        switch self {
        case 0: return .NotDefined
        case 1: return .IncomeLess20
        case 2: return .Income20_35
        case 3: return .Income35_50
        case 4: return .Income50_75
        case 5: return .Income75_100
        case 7: return .Income100_150
        case 8: return .Income150_200
        case 9: return .IncomeMore200
        default:
            HGReportHandler.shared.report("int: |\(self)| is not enum |HouseholdIncome| mapable, using NotDefined", type: .Error)
        }
        return .NotDefined
    }
    
    /// returns RiderDuration.  Logs error and returns NotDefined if not a valid Int.
    var riderDuration: RiderDuration {
        
        switch self {
        case 0: return .NotDefined
        case 1: return .Childhood
        case 2: return .Years
        case 3: return .OneYear
        case 4: return .JustStarted
        default:
            HGReportHandler.shared.report("int: |\(self)| is not enum |RiderDuration| mapable, using NotDefined", type: .Error)
        }
        return .NotDefined
    }
    
    /// returns RiderFrequency.  Logs error and returns NotDefined if not a valid Int.
    var riderFrequency: RiderFrequency {
        
        switch self {
        case 0: return .NotDefined
        case 1: return .LessMonth
        case 2: return .SeveralMonth
        case 3: return .SeveralWeek
        case 4: return .Daily
        default:
            HGReportHandler.shared.report("int: |\(self)| is not enum |RiderFrequency| mapable, using NotDefined", type: .Error)
        }
        return .NotDefined
    }
    
    /// returns RiderType.  Logs error and returns NotDefined if not a valid Int.
    var riderType: RiderType {
        
        switch self {
        case 0: return .NotDefined
        case 1: return .Strong
        case 2: return .Confident
        case 3: return .Comfortable
        case 4: return .Concerned
        default:
            HGReportHandler.shared.report("int: |\(self)| is not enum |RiderType| mapable, using NotDefined", type: .Error)
        }
        return .NotDefined
    }
}