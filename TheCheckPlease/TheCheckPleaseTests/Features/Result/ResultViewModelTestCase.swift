//
//  ResultViewModelTestCase.swift
//  TheCheckPleaseTests
//
//  Created by Rafael Lucatto on 1/23/23.
//

import Foundation
import XCTest

@testable import TheCheckPlease

final class ResultViewModelTestCase: XCTestCase {

    var sut: ResultViewModel!

    override func setUp() {
        super.setUp()
        sut = .init(result: .init(total: 50.0, peopleSplittingTheBill: 2, tipPercentage: 0.0))
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_whenInitialized_shouldHaveExpectedColorForView() {
        XCTAssertEqual(sut.backgroundColor, #colorLiteral(red: 0.1733241677, green: 0.5867868066, blue: 0.6649774909, alpha: 1))
    }

    func test_whenInitialized_withTip_withAtLeast2PeopleSplittingTheBill_shouldReturnExpectedSummary() {
        sut = .init(result: .init(total: 50.0, peopleSplittingTheBill: 2, tipPercentage: 10.0))
        XCTAssertEqual(sut.summary, "with a 10% tip and divided by 2 people.")
        XCTAssertEqual(sut.totalPerPerson, 27.5)
    }

    func test_whenInitialized_withoutTip_withAtLeast2PeopleSplittingTheBill_shouldReturnExpectedSummary() {
        sut = .init(result: .init(total: 50.0, peopleSplittingTheBill: 2, tipPercentage: 0.0))
        XCTAssertEqual(sut.summary, "divided by 2 people.")
        XCTAssertEqual(sut.totalPerPerson, 25.0)
    }

    func test_whenInitialized_withTip_withNoPeopleToSplitTheBillWith_shouldReturnExpectedSummary() {
        sut = .init(result: .init(total: 50.0, peopleSplittingTheBill: 1, tipPercentage: 20.0))
        XCTAssertEqual(sut.summary, "with a 20% tip.")
        XCTAssertEqual(sut.totalPerPerson, 60.0)
    }

}
