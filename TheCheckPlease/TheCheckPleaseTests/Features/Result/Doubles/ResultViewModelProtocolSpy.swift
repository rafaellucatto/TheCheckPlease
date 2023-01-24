//
//  ResultViewModelProtocolSpy.swift
//  TheCheckPleaseTests
//
//  Created by Rafael Lucatto on 1/23/23.
//

import Foundation
import UIKit

@testable import TheCheckPlease

final class ResultViewModelProtocolSpy: ResultViewModelProtocol {

    var backgroundColor: UIColor = .white

    var result: Result = .init(total: 50.0,
                               peopleSplittingTheBill: 2,
                               tipPercentage: 0.0)

    var summary: String = "Summary sentence goes here."

    var totalPerPerson: Double = 25.0

}
