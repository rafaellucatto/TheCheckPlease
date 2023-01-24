//
//  TotalCalculatorViewModel.swift
//  TheCheckPlease
//
//  Created by Rafael Lucatto on 1/23/23.
//

import Core
import Foundation
import UIKit

protocol TotalCalculatorViewModelProtocol {
    var percentageButtonQuantity: Int { get }
    var percentages: [Int] { get }
    var cellIdentifier: String { get }
    var coordinatorDelegate: CoordinatorDelegate? { get set }
    var examplePlaceHolders: [String] { get }
    var items: [Item] { get set }
    var numberOfRows: Int { get }
    var totalCalculatorViewDelegate: TotalCalculatorViewModelDelegate? { get set }
    var viewTitle: String { get }
    var backgroundColor: UIColor { get }
    func calculateAmount()
    func handleButtonHighlight(tag: Int)
    func handlePeopleQuantity(stepperValue: Double)
    func presentAlert()
    func savePrices()
    func setupInitialSelectedButton()
}

protocol TotalCalculatorViewModelDelegate: AnyObject {
    func dismissButtonHighlight()
    func highlightButton(tag: Int)
    func setupInitialSelectedButton()
    func setStepperValue(value: Double)
    func reloadTableViewData()
}

final class TotalCalculatorViewModel: TotalCalculatorViewModelProtocol {
    let userDefaults: UserDefaults = .standard
    let viewTitle: String = "Check Please"
    let cellIdentifier: String = "simpleCell"
    let backgroundColor: UIColor = #colorLiteral(red: 0.1733241677, green: 0.5867868066, blue: 0.6649774909, alpha: 1)
    let percentages: [Int] = [0, 10, 15, 20]

    let examplePlaceHolders: [String] = [
        "e.g. 29.90", "e.g. 9.90", "e.g. 36.80", "e.g. 18.50", "e.g. 42.99", "e.g. 49.00"
    ]

    var percentage: Double = 10.0
    var peopleSplittingTheBill: Double = 2.0
    var items: [Item] = []
    var numberOfRows: Int { items.count }
    var percentageButtonQuantity: Int { percentages.count }

    weak var coordinatorDelegate: CoordinatorDelegate?
    weak var totalCalculatorViewDelegate: TotalCalculatorViewModelDelegate?

    init() {
        loadData()
    }

    func handleButtonHighlight(tag: Int) {
        totalCalculatorViewDelegate?.dismissButtonHighlight()
        percentage = Double(tag)
        totalCalculatorViewDelegate?.highlightButton(tag: tag)
    }

    func setupInitialSelectedButton() {
        totalCalculatorViewDelegate?.setupInitialSelectedButton()
    }

    func calculateAmount() {
        var total: Double = 0.0
        for item in items where item.checked {
            total += item.price
        }
        if total == 0.0 {
            coordinatorDelegate?.presentError()
            return
        }
        coordinatorDelegate?.presentResult(total: total,
                                           peopleSplittingTheBill: peopleSplittingTheBill,
                                           tipPercentage: percentage)
    }

    func savePrices() {
        saveData()
    }

    func handlePeopleQuantity(stepperValue: Double) {
        peopleSplittingTheBill = stepperValue < 1.0 ? 1.0 : stepperValue > 100.0 ? 100.0 : stepperValue
        totalCalculatorViewDelegate?.setStepperValue(value: peopleSplittingTheBill)
    }

    func presentAlert() {
        var textField: UITextField = .init()
        let alert: UIAlertController = .init(title: "Add item price",
                                             message: nil,
                                             preferredStyle: .alert)
        let placeholderSize: Int = examplePlaceHolders.count
        alert.addTextField { [weak self] alertTextField in
            alertTextField.placeholder = self?.examplePlaceHolders[Int.random(in: 0 ..< placeholderSize)]
            textField = alertTextField
            alertTextField.keyboardType = .decimalPad
        }
        let action: UIAlertAction = .init(title: "Add price", style: .default) { [weak self] _ in
            guard !textField.text!.isEmpty && textField.text != "" else {
                return
            }
            var priceInDouble: Double {
                var newValue: String = ""
                newValue += String(textField.text!.map {
                    $0 == "," ? "." : $0
                })
                let doubleValue = Double(newValue) ?? 0.0
                let formattedString = String(format: "%.2f", doubleValue)
                return Double(formattedString) ?? 0.00
            }
            self?.items.append(Item(price: priceInDouble, checked: true))
            self?.saveData()
            DispatchQueue.main.async { [weak self] in
                self?.totalCalculatorViewDelegate?.reloadTableViewData()
            }
        }
        alert.addAction(action)
        coordinatorDelegate?.presentAlert(alert)
    }

    func saveData() {
        if saveData2(prices: items) {
            debugPrint("Save was successful.")
            return
        }
        debugPrint("Failed to save prices.")
    }

    func loadData() {
        if let prices = loadData2() {
            items = prices
            DispatchQueue.main.async { [weak self] in
                self?.totalCalculatorViewDelegate?.reloadTableViewData()
            }
        }
    }

    func saveData2(prices: [Item]) -> Bool {
        if let encodedData: Data = try? JSONEncoder().encode(prices) {
            userDefaults.set(encodedData, forKey: Items.saveAndLoad.rawValue)
            return true
        }
        return false
    }

    func loadData2() -> [Item]? {
        if let savedData = userDefaults.object(forKey: Items.saveAndLoad.rawValue) as? Data {
            if let oldPrices = try? JSONDecoder().decode([Item].self, from: savedData) {
                return oldPrices
            }
        }
        return nil
    }
}
