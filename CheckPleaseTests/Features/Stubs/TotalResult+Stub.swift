//
//  TotalResult+Stub.swift
//  CheckPleaseTests
//
//  Created by Rafael Lucatto on 1/30/24.
//

import Foundation

@testable import CheckPlease

extension TotalResult {
    
    static func stub(priceTotal: Double = 54.32, percentage: Int = 15, peopleTotal: Int = 3) -> TotalResult {
        return TotalResult(priceTotal: priceTotal, percentage: percentage, peopleTotal: peopleTotal)
    }
    
}
