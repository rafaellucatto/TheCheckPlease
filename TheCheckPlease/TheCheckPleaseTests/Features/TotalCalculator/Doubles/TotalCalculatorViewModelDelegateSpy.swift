//
//  TotalCalculatorViewModelDelegateSpy.swift
//  TheCheckPleaseTests
//
//  Created by Rafael Lucatto on 1/23/23.
//

import Foundation
import UIKit

@testable import TheCheckPlease

final class TotalCalculatorViewModelDelegateSpy: TotalCalculatorViewModelDelegate {

    var dismissButtonHighlightCount: Int = 0
    var highlightButtonCount: Int = 0
    var setupInitialSelectedButtonCount: Int = 0
    var setStepperValueCount: Int = 0
    var reloadTableViewDataCount: Int = 0

    var percentageButtonArray: [UIButton] {
        var buttonArray: [UIButton] = []
        for _ in 0..<4 {
            buttonArray.append(.init())
        }
        return buttonArray
    }

    func dismissButtonHighlight() {
        dismissButtonHighlightCount += 1
    }

    func highlightButton(tag: Int) {
        highlightButtonCount += 1
    }

    func setupInitialSelectedButton() {
        setupInitialSelectedButtonCount += 1
    }

    func setStepperValue(value: Double) {
        setStepperValueCount += 1
    }

    func reloadTableViewData() {
        reloadTableViewDataCount += 1
    }

}
