//
//  ItemCollectionViewModelTestCase.swift
//  CheckPleaseUITests
//
//  Created by Rafael Lucatto on 2/13/24.
//

import Foundation
import XCTest

@testable import CheckPleaseUI

final class ItemCollectionViewModelTestCase: XCTestCase {
    
    var userDefaults: SpyCPUserDetauls!
    var sut: CPItemCollectionViewModel!
    
    override func setUp() {
        super.setUp()
        userDefaults = SpyCPUserDetauls()
        sut = CPItemCollectionViewModel(userDefaults: userDefaults)
        sut.items = [CPItem(price: 1.1, isChecked: true),
                     CPItem(price: 2.2, isChecked: true),
                     CPItem(price: 3.3, isChecked: true),
                     CPItem(price: 4.4, isChecked: true)]
    }
    
    override func tearDown() {
        sut = nil
        userDefaults = nil
        super.tearDown()
    }
    
    func test_whenRemovingItems_shouldTriggerExpectedFunctions(){
        sut.removeItem(at: 1)
        XCTAssertEqual(sut.items.count, 3)
        XCTAssertTrue(userDefaults.didCallSaveData)
    }
    
    func test_whenDuplicatingItems_shouldTriggerExpectedFunctions() {
        sut.duplicateItem(at: 2)
        XCTAssertEqual(sut.items.last!.price, 3.3)
        XCTAssertEqual(sut.items.count, 5)
    }
    
    func test_whenTogglingCheckMark_shouldTriggerExpectedFunctions() {
        sut.toggleCheckMark(for: 3)
        XCTAssertEqual(sut.items.last!.isChecked, false)
    }
    
    func test_whenLoadingData_shouldReturnExpectedItems() {
        sut.items.removeAll()
        userDefaults.shouldLoadItems = true
        userDefaults.itemsToLoad = [CPItem(price: 9.9, isChecked: true),
                                    CPItem(price: 19.9, isChecked: true),
                                    CPItem(price: 29.9, isChecked: false),
                                    CPItem(price: 39.9, isChecked: false),
                                    CPItem(price: 25.9, isChecked: true),
                                    CPItem(price: 10.9, isChecked: false),
                                    CPItem(price: 12.9, isChecked: true)]
        sut.loadData()
        XCTAssertTrue(userDefaults.didCallLoadData)
        XCTAssertEqual(sut.items.count, 7)
    }
    
    func test_whenViewAppears_shouldTriggerExpectedFunction() {
        sut.viewDidAppear()
        XCTAssertTrue(userDefaults.didCallLoadData)
    }
    
    func test_whenTappingAdd_shouldTriggerExpectedFunction() {
        sut.itemText = "23.15"
        sut.didTapAdd()
        XCTAssertEqual(sut.items.last!.price, 23.15)
    }
    
    func test_whenMakingNewCheck_shouldReturnExpectedObject() {
        sut.items = [CPItem(price: 19.9, isChecked: true),
                     CPItem(price: 29.9, isChecked: true),
                     CPItem(price: 32.0, isChecked: true),
                     CPItem(price: 9.9, isChecked: false),
                     CPItem(price: 27.5, isChecked: true),
                     CPItem(price: 12.8, isChecked: true)]
        sut.chosenPercentage = 20
        sut.peopleSplittingTheBill = 3
        let check: CPCheck = sut.makeCheck()
        XCTAssertEqual(check.totalPerPerson, 48.839999999999996)
        XCTAssertEqual(check.peopleSplittingTheBill, 3)
        XCTAssertEqual(check.tip, 20)
    }
    
    func test_whenTappingOnDeleteAllItems_shouldReturnExpectedItemCount() {
        sut.deleteAllItems()
        XCTAssertEqual(sut.items.count, 0)
    }
    
}
