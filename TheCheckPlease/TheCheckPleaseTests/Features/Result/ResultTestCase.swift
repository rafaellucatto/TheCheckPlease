//
//  ResultTestCase.swift
//  TheCheckPleaseTests
//
//  Created by Rafael Lucatto on 1/23/23.
//

import Foundation
import XCTest

@testable import TheCheckPlease

final class ResultTestCase: XCTestCase {

    var sut: Result!

    override func setUp() {
        super.setUp()
        sut = .init(total: 56.78,
                    peopleSplittingTheBill: 3.0,
                    tipPercentage: 10.0)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func test_whenInitialized_shouldReturnExpectedValues() {
        XCTAssertEqual(sut.total, 56.78)
        XCTAssertEqual(sut.peopleSplittingTheBill, 3.0)
        XCTAssertEqual(sut.tipPercentage, 10.0)
    }

}
