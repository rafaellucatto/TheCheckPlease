//
//  CoordinatorDelegateSpy.swift
//  TheCheckPleaseTests
//
//  Created by Rafael Lucatto on 1/23/23.
//

import Foundation
import UIKit

@testable import TheCheckPlease

final class CoordinatorDelegateSpy: CoordinatorDelegate {

    var presentAlertCount: Int = 0
    var presentErrorCount: Int = 0
    var presentResultCount: Int = 0

    func presentAlert(_ alert: UIAlertController) {
        presentAlertCount += 1
    }

    func presentError() {
        presentErrorCount += 1
    }

    func presentResult(total: Double, peopleSplittingTheBill: Double, tipPercentage: Double) {
        presentResultCount += 1
    }

}
