//
//  ItemsViewModel.swift
//  CheckPlease
//
//  Created by Rafael Lucatto on 1/29/24.
//

import Foundation
import UIKit

protocol ItemsViewModelScreenDelegate: AnyObject {
    func presentAlert(_ alert: UIAlertController, animated: Bool)
    func didTapCalculate(with total: TotalResult)
}

protocol ItemsViewModelDelegate: AnyObject {
    func deselectAllButtons()
    func highlightButton(with tag: Int)
    func setStepperValue(value: Double)
    func reloadTable()
}

protocol ItemsViewModelProtocol: UITableViewDataSource, UITableViewDelegate {
    var delegate: ItemsViewModelDelegate? { get set }
    var screenDelegate: ItemsViewModelScreenDelegate? { get set }
    var placeHolderExamples: [String] { get }
    var percentagesAvailable: [Int] { get }
    
    func didTapPercentageButton(with tag: Int)
    func handlePeopleCounter(for int: Double)
    func didTapPlusButton()
    func didTapCalculateButton()
}

final class ItemsViewModel: NSObject, ItemsViewModelProtocol {
    
    weak var delegate: ItemsViewModelDelegate?
    weak var screenDelegate: ItemsViewModelScreenDelegate?
    
    var chosenPercentage: Int = 10
    var peopleSplittingTheBill: Double = 2.0
    var items: [Item] = []
    
    let percentagesAvailable: [Int] = [0, 10, 15, 20]
    let placeHolderExamples: [String] = ["32.90", "17.50", "24.90", "42.8", "9.80"]
    
    override init() {
        super.init()
        let oldData: [Item] = loadData()
        guard !oldData.isEmpty else { return }
        items.removeAll()
        items.append(contentsOf: oldData)
    }
    
    func didTapPercentageButton(with tag: Int) {
        delegate?.deselectAllButtons()
        chosenPercentage = tag
        delegate?.highlightButton(with: tag)
    }
    
    func handlePeopleCounter(for value: Double) {
        peopleSplittingTheBill = value < 1.0 ? 1.0 : value > 30.0 ? 30.0 : value
        delegate?.setStepperValue(value: peopleSplittingTheBill)
    }
    
    func didTapPlusButton() {
        let actionController: UIAlertController = .init(title: "Item price", message: "", preferredStyle: .alert)
        actionController.addTextField { [weak self] textField in
            textField.placeholder = self?.placeHolderExamples.randomElement() ?? "19.90"
            textField.keyboardType = .decimalPad
        }
        let addAction: UIAlertAction = .init(title: "Add", style: .default) { [weak self] _ in
            if let tf: UITextField = actionController.textFields?.first {
                let value: Double = Double(tf.text?.replacingOccurrences(of: ",", with: ".") ?? "") ?? 0
                guard value > 0 else { return }
                self?.items.append(Item(price: value, isChecked: true))
                self?.saveData()
                DispatchQueueHandler.async {
                    self?.delegate?.reloadTable()
                }
            }
        }
        let cancelAction: UIAlertAction = .init(title: "Cancel", style: .destructive)
        [addAction, cancelAction].forEach { actionController.addAction($0) }
        screenDelegate?.presentAlert(actionController, animated: true)
    }
    
    private func saveData() {
        guard let itemCollection: Data = try? JSONEncoder().encode(self.items) else { return }
        UserDefaults.standard.setValue(itemCollection, forKey: ItemConfig.saveOrLoad.rawValue)
    }
    
    private func loadData() -> [Item] {
        if let data: Data = UserDefaults.standard.object(forKey: ItemConfig.saveOrLoad.rawValue) as? Data,
           let itemCollection: [Item] = try? JSONDecoder().decode([Item].self, from: data) {
            return itemCollection
        }
        return []
    }
    
    private enum ItemConfig: String {
        case saveOrLoad = "ItemConfigSaveOrLoad"
    }
    
    func didTapCalculateButton() {
        guard !self.items.isEmpty else {
            handleEmptyList()
            return
        }
        var total: Double = 0
        for item in self.items where item.isChecked {
            total += item.price
        }
        total = total.plusPercentage(of: Double(chosenPercentage))
        total = total / peopleSplittingTheBill
        screenDelegate?.didTapCalculate(with: TotalResult(priceTotal: total, percentage: chosenPercentage, peopleTotal: Int(peopleSplittingTheBill)))
    }
    
    private func handleEmptyList() {
        let alertController: UIAlertController = .init(title: "Oops!", message: "No items found in the list...", preferredStyle: .alert)
        let action: UIAlertAction = .init(title: "Cancel", style: .destructive)
        alertController.addAction(action)
        self.screenDelegate?.presentAlert(alertController, animated: true)
    }
    
}

extension ItemsViewModel: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.identifier, for: indexPath)
        cell.textLabel?.text = items[indexPath.row].price.toString()
        cell.backgroundColor = indexPath.row % 2 == 0 ? .white : .appBGColor
        cell.accessoryType = items[indexPath.row].isChecked ? .checkmark : .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.performBatchUpdates {
                items.remove(at: indexPath.row)
                saveData()
                tableView.deleteRows(at: [indexPath], with: .fade)
            } completion: { hasFinished in
                self.delegate?.reloadTable()
            }
        }
    }
    
}

extension ItemsViewModel: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        items[indexPath.row].isChecked.toggle()
        saveData()
        tableView.reloadRows(at: [indexPath], with: .middle)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
}
