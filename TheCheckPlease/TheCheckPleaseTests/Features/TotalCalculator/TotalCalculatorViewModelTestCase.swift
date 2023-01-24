//
//  TotalCalculatorViewModelTestCase.swift
//  TheCheckPleaseTests
//
//  Created by Rafael Lucatto on 1/23/23.
//

import Foundation
import XCTest

@testable import TheCheckPlease

final class TotalCalculatorViewModelTestCase: XCTestCase {

    var sut: TotalCalculatorViewModel!
    var delegate: TotalCalculatorViewModelDelegateSpy!
    var coordinatorDelegate: CoordinatorDelegateSpy!

    override func setUp() {
        super.setUp()
        coordinatorDelegate = .init()
        delegate = .init()
        sut = .init()
        sut.totalCalculatorViewDelegate = delegate
        sut.coordinatorDelegate = coordinatorDelegate
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_whenInitialized_shouldHaveExpectedPlaceholders() {
        XCTAssertEqual(sut.examplePlaceHolders, ["e.g. 29.90", "e.g. 9.90", "e.g. 36.80", "e.g. 18.50", "e.g. 42.99", "e.g. 49.00"])
    }

    func test_whenInitialized_shouldHaveExpectedExpectedBackgroundColorForView() {
        XCTAssertEqual(sut.backgroundColor, #colorLiteral(red: 0.1733241677, green: 0.5867868066, blue: 0.6649774909, alpha: 1))
    }
    
    func test_whenHandleButtonHighlightGetsCalled() {
        sut.handleButtonHighlight(tag: 15)
        XCTAssertEqual(delegate.dismissButtonHighlightCount, 1)
        XCTAssertEqual(sut.percentage, 15.0)
        XCTAssertEqual(delegate.highlightButtonCount, 1)
    }

    func test_whenCalculateAmountGetsCalled_shouldPresentResult() {
        sut.items = [.init(price: 5.9, checked: true)]
        sut.calculateAmount()
        XCTAssertEqual(coordinatorDelegate.presentResultCount, 1)
    }

    func test_whenCalculateAmountGetsCalled_withoutResult_shouldPresentError() {
        sut.items = [.init(price: 5.9, checked: false)]
        sut.calculateAmount()
        XCTAssertEqual(coordinatorDelegate.presentErrorCount, 1)
    }

    func test_whenPresentAlertGetsCalled_withoutResult_shouldPresentError() {
        sut.presentAlert()
        XCTAssertEqual(coordinatorDelegate.presentAlertCount, 1)
    }

    func test_whenHandlePeopleQuantityGetsCalled() {
        sut.handlePeopleQuantity(stepperValue: 3.0)
        XCTAssertEqual(sut.peopleSplittingTheBill, 3.0)
        XCTAssertEqual(delegate.setStepperValueCount, 1)
    }

}
