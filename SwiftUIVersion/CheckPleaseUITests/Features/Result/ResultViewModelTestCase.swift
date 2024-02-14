//
//  ResultViewModelTestCase.swift
//  CheckPleaseUITests
//
//  Created by Rafael Lucatto on 2/13/24.
//

import Foundation
import XCTest

@testable import CheckPleaseUI

final class ResultViewModelTestCase: XCTestCase {
    
    var check: CPCheck!
    var sut: CPResultViewModel!
    
    override func setUp() {
        super.setUp()
        check = CPCheck(totalPerPerson: 43.9, peopleSplittingTheBill: 3, tip: 10)
        sut = CPResultViewModel(check: check)
    }
    
    override func tearDown() {
        sut = nil
        check = nil
        super.tearDown()
    }
    
    func test_whenInitialized_shouldReturnExpectedValues() {
        XCTAssertEqual(sut.totalPerPerson, "$43.90")
        XCTAssertEqual(sut.peopleCount, "3")
        XCTAssertEqual(sut.tip, "10%")
    }
    
}
