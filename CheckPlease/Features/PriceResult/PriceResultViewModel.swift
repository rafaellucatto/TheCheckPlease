//
//  PriceResultViewModel.swift
//  CheckPlease
//
//  Created by Rafael Lucatto on 1/30/24.
//

import Foundation

protocol PriceResultViewModelProtocol {
    var total: String { get }
    var people: String { get }
    var percentage: String { get }
}

final class PriceResultViewModel: PriceResultViewModelProtocol {
    
    private let totalResult: TotalResult
    
    init(totalResult: TotalResult) {
        self.totalResult = totalResult
    }
    
    var total: String { return "$" + totalResult.priceTotal.toString() }
    
    var people: String { return totalResult.peopleTotal.description }
    
    var percentage: String { return totalResult.percentage.description + "%" }
    
}
