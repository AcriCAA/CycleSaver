//
//  ReportHandler.swift
//  CycleSaver
//
//  Created by David Vallas on 3/15/16.
//  Copyright © 2016 Kathryn Killebrew. All rights reserved.
//

import Foundation

struct HGReportHandler {
    
    static let shared = HGReportHandler()
    
    let hgReportHandlerInfo = true
    let hgReportHandlerWarn = true
    let hgReportHandlerError = true
    let hgReportHandlerAlert = true
    let hgReportHandlerAssert = true
    
    func report(msg: String, type: HGErrorType) {
        
        switch (type) {
        case .Info:    if hgReportHandlerInfo == false { return }
        case .Warn:    if hgReportHandlerInfo == false { return }
        case .Error:   if hgReportHandlerInfo == false { return }
        case .Alert:   if hgReportHandlerInfo == false { return }
        case .Assert:  if hgReportHandlerInfo == false { return }
        }
        
        let report = "[\(type.string)]" + msg
        print(report)
    }
}
