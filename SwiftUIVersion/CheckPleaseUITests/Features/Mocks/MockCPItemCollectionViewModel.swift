//
//  MockItemCollectionViewModel.swift
//  CheckPleaseUITests
//
//  Created by Rafael Lucatto on 2/13/24.
//

import Foundation

@testable import CheckPleaseUI

final class MockCPItemCollectionViewModel: CPItemCollectionViewModelProtocol {
    
    var items: [CPItem] = []
    var chosenPercentage: Int = 10
    var peopleSplittingTheBill: Int = 2
    var shouldPresentResultView: Bool = false
    var shouldPresentAlert: Bool = false
    var itemText: String = ""
    
    func removeItem(at index: Int) {}
    func duplicateItem(at index: Int) {}
    func toggleCheckMark(for index: Int) {}
    func didTapCancel() {}
    func saveEncodedData() {}
    func loadData() {}
    func viewDidAppear() {}
    func didTapAdd() {}
    func deleteAllItems() {}
    
    func makeCheck() -> CPCheck {
        return CPCheck(totalPerPerson: 45.9, peopleSplittingTheBill: 3, tip: 0)
    }
    
}
