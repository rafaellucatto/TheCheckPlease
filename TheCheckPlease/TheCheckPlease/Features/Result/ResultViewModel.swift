//
//  ResultViewModel.swift
//  TheCheckPlease
//
//  Created by Rafael Lucatto on 1/23/23.
//

import Foundation
import UIKit

protocol ResultViewModelProtocol {
    var backgroundColor: UIColor { get }
    var result: Result { get }
    var summary: String { get }
    var totalPerPerson: Double { get }
}

final class ResultViewModel: ResultViewModelProtocol {

    let result: Result

    init(result: Result) {
        self.result = result
    }

    var backgroundColor: UIColor { #colorLiteral(red: 0.1733241677, green: 0.5867868066, blue: 0.6649774909, alpha: 1) }

    private var arePeopleGivingAnyTip: Bool { result.tipPercentage > 0.0 && result.peopleSplittingTheBill > 1.0 }
    private var arePeopleGivingNoTips: Bool { result.peopleSplittingTheBill > 1.0 }
    private var isOnePersonGivingAnyTip: Bool { result.tipPercentage > 0.0 }

    var summary: String {
        if arePeopleGivingAnyTip {
            return "with a \(Int(result.tipPercentage))% tip and divided by \(Int(result.peopleSplittingTheBill)) people."
        }
        if arePeopleGivingNoTips {
            return "divided by \(Int(result.peopleSplittingTheBill)) people."
        }
        if isOnePersonGivingAnyTip {
            return "with a \(Int(result.tipPercentage))% tip."
        }
        return ""
    }

    var totalPerPerson: Double {
        guard result.peopleSplittingTheBill > 0.0 else {
            return 0.0
        }
        return (result.total + (result.total * (result.tipPercentage / 100))) / result.peopleSplittingTheBill
    }

}
