//
//  Result.swift
//  TheCheckPlease
//
//  Created by Rafael Lucatto on 1/23/23.
//

import Foundation

final class Result {

    let total: Double
    let peopleSplittingTheBill: Double
    let tipPercentage: Double

    init(total: Double, peopleSplittingTheBill: Double, tipPercentage: Double) {
        self.total = total
        self.peopleSplittingTheBill = peopleSplittingTheBill
        self.tipPercentage = tipPercentage
    }

}
