//
//  MockItemsViewModelDelegate.swift
//  CheckPleaseTests
//
//  Created by Rafael Lucatto on 1/31/24.
//

import Foundation

@testable import CheckPlease

final class MockItemsViewModelDelegate: ItemsViewModelDelegate {
    
    var deselectAllButtonsCount: Int = 0
    var highlightButtonCount: Int = 0
    var setStepperValueCount: Int = 0
    var reloadTableCount: Int = 0
    
    func deselectAllButtons() {
        deselectAllButtonsCount += 1
    }
    
    func highlightButton(with tag: Int) {
        highlightButtonCount += 1
    }
    
    func setStepperValue(value: Double) {
        setStepperValueCount += 1
    }
    
    func reloadTable() {
        reloadTableCount += 1
    }
    
}
