//
//  TotalCalculatorViewModelProtocolSpy.swift
//  TheCheckPleaseTests
//
//  Created by Rafael Lucatto on 1/23/23.
//

import Foundation
import UIKit

@testable import TheCheckPlease

final class TotalCalculatorViewModelProtocolSpy: TotalCalculatorViewModelProtocol {

    var percentageButtonQuantity: Int { percentages.count }
    var percentages: [Int] { [0, 10, 15, 20] }
    var cellIdentifier: String { "SimpleCell" }
    var coordinatorDelegate: CoordinatorDelegate?
    var examplePlaceHolders: [String] { ["placeHolder1", "placeHolder2"] }
    var items: [Item] = []
    var numberOfRows: Int { items.count }
    var totalCalculatorViewDelegate: TotalCalculatorViewModelDelegate?
    var viewTitle: String = "viewTitle"
    var backgroundColor: UIColor = .red

    var calculateAmountCount: Int = 0
    var handleButtonHighlightCount: Int = 0
    var handlePeopleQuantityCount: Int = 0
    var presentAlertCount: Int = 0
    var savePricesCount: Int = 0
    var setupInitialSelectedButtonCount: Int = 0
    
    func calculateAmount() {
        calculateAmountCount += 1
    }

    func handleButtonHighlight(tag: Int) {
        handleButtonHighlightCount += 1
    }

    func handlePeopleQuantity(stepperValue: Double) {
        handlePeopleQuantityCount += 1
    }

    func presentAlert() {
        presentAlertCount += 1
    }

    func savePrices() {
        savePricesCount += 1
    }

    func setupInitialSelectedButton() {
        setupInitialSelectedButtonCount += 1
    }

}
