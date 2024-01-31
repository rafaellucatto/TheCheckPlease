//
//  Double+Extension.swift
//  CheckPlease
//
//  Created by Rafael Lucatto on 1/29/24.
//

import Foundation

extension Double {
    
    func toString() -> String { return String(format: "%.2f", self) }
    
    func plusPercentage(of percentage: Double) -> Double {
        return self + (self * percentage / 100)
    }
    
}
