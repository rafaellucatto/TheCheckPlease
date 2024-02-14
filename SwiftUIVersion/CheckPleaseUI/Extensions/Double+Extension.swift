//
//  Double+Extension.swift
//  CheckPleaseUI
//
//  Created by Rafael Lucatto on 2/10/24.
//

import Foundation

extension Double {
    
    func toString() -> String {
        return String(format: "%.2f", self)
    }
    
    func addPercentage(_ percentage: Double) -> Double {
        return self + ((self * percentage) / 100)
    }
    
}
