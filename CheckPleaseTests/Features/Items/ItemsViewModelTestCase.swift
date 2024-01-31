//
//  ItemsViewModelTestCase.swift
//  CheckPleaseTests
//
//  Created by Rafael Lucatto on 1/30/24.
//

import Foundation
import XCTest

@testable import CheckPlease

final class ItemsViewModelTestCase: XCTestCase {
    
    var delegate: MockItemsViewModelDelegate!
    var screenDelegate: MockItemsViewModelScreenDelegate!
    var sut: ItemsViewModel!
    
    override func setUp() {
        super.setUp()
        delegate = .init()
        screenDelegate = .init()
        sut = .init()
        sut.delegate = delegate
        sut.screenDelegate = screenDelegate
    }
    
    override func tearDown() {
        sut = nil
        screenDelegate = nil
        delegate = nil
        super.tearDown()
    }
    
    func test_whenTappingPlusButton_shouldTriggerCorrectFunction() {
        sut.didTapPlusButton()
        XCTAssertEqual(screenDelegate.presentAlertCount, 1)
    }
    
    func test_whenTappingCalculateButton_shouldTriggerCorrectFunction() {
        sut.items = [Item(price: 12.34, isChecked: true)]
        sut.didTapCalculateButton()
        XCTAssertEqual(screenDelegate.didTapCalculateCount, 1)
    }
    
    func test_whenHandlingPeopleCounter_shouldTriggerCorrectFunction() {
        sut.handlePeopleCounter(for: 3.0)
        XCTAssertEqual(delegate.setStepperValueCount, 1)
    }
    
    func test_whenTappingPercentageButtonCounter_shouldTriggerCorrectFunction() {
        sut.didTapPercentageButton(with: 0)
        XCTAssertEqual(delegate.highlightButtonCount, 1)
    }
    
}
