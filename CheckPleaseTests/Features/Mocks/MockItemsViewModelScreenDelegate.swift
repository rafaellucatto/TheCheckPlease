//
//  MockItemsViewModelScreenDelegate.swift
//  CheckPleaseTests
//
//  Created by Rafael Lucatto on 1/31/24.
//

import Foundation
import UIKit

@testable import CheckPlease

final class MockItemsViewModelScreenDelegate: ItemsViewModelScreenDelegate {
    
    var presentAlertCount: Int = 0
    var didTapCalculateCount: Int = 0
    
    func presentAlert(_ alert: UIAlertController, animated: Bool) {
        presentAlertCount += 1
    }
    
    func didTapCalculate(with total: CheckPlease.TotalResult) {
        didTapCalculateCount += 1
    }
    
}
