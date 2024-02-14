//
//  SheetTestCase.swift
//  CheckPleaseUITests
//
//  Created by Rafael Lucatto on 2/14/24.
//

import Foundation
import XCTest

@testable import CheckPleaseUI

final class SheetTestCase: XCTestCase {
    
    var sut: Sheet!
    
    override func setUp() {
        super.setUp()
        let check: CPCheck = CPCheck(totalPerPerson: 0, peopleSplittingTheBill: 0, tip: 0)
        sut = .result(check)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_whenInitialized_shouldReturnExpectedId() {
        XCTAssertEqual(sut.id, "theCheck")
    }
    
}
