//
//  CPItemCollectionViewModel.swift
//  CheckPleaseUI
//
//  Created by Rafael Lucatto on 2/12/24.
//

import Foundation

protocol CPItemCollectionViewModelProtocol: ObservableObject {
    var items: [CPItem] { get set }
    var chosenPercentage: Int { get set }
    var peopleSplittingTheBill: Int { get set }
    var shouldPresentResultView: Bool { get set }
    var shouldPresentAlert: Bool { get set }
    var itemText: String { get set }
    
    func removeItem(at index: Int)
    func duplicateItem(at index: Int)
    func toggleCheckMark(for index: Int)
    func didTapCancel()
    func saveEncodedData()
    func loadData()
    func viewDidAppear()
    func didTapAdd()
    func makeCheck() -> CPCheck
    func deleteAllItems()
}

final class CPItemCollectionViewModel: CPItemCollectionViewModelProtocol {
    
    @Published var items: [CPItem] = []
    @Published var chosenPercentage: Int = 10
    @Published var peopleSplittingTheBill: Int = 2
    @Published var shouldPresentResultView: Bool = false
    @Published var shouldPresentAlert: Bool = false
    @Published var itemText: String = ""
    
    private var didLoadItems: Bool = false
    
    private let userDefaults: CPUserDefaultsProtocol
    
    init(userDefaults: CPUserDefaultsProtocol = CPUserDefaults.shared) {
        self.userDefaults = userDefaults
    }
    
    func removeItem(at index: Int) {
        items.remove(at: index)
        saveEncodedData()
    }
    
    func duplicateItem(at index: Int) {
        let price: Double = items[index].price
        items.append(CPItem(price: price, isChecked: true))
        saveEncodedData()
    }
    
    func toggleCheckMark(for index: Int) {
        items[index].isChecked.toggle()
        saveEncodedData()
    }
    
    func didTapCancel() {
        itemText = ""
    }
    
    func saveEncodedData() {
        let currentItems: [CPItem] = items
        guard let data: Data = try? JSONEncoder().encode(currentItems) else { return }
        userDefaults.saveData(data: data)
    }
    
    func loadData() {
        guard let data: Data = userDefaults.loadData() else {
            self.items.removeAll()
            return
        }
        guard let items: [CPItem] = try? JSONDecoder().decode([CPItem].self, from: data) else { return }
        self.items.append(contentsOf: items)
    }
    
    func viewDidAppear() {
        guard !didLoadItems else { return }
        didLoadItems = true
        loadData()
    }
    
    func didTapAdd() {
        let itemPrice: Double = Double(itemText.replacingOccurrences(of: ",", with: ".")) ?? 0
        itemText = ""
        guard itemPrice > 0 else { return }
        items.append(CPItem(price: itemPrice, isChecked: true))
        saveEncodedData()
    }
    
    func makeCheck() -> CPCheck {
        var total: Double = 0.0
        for item in items where item.isChecked {
            total += item.price
        }
        total = total.addPercentage(Double(chosenPercentage))
        total = (total / Double(peopleSplittingTheBill))
        return CPCheck(totalPerPerson: total,
                       peopleSplittingTheBill: peopleSplittingTheBill,
                       tip: chosenPercentage)
    }
    
    func deleteAllItems() {
        self.items.removeAll()
    }
}
