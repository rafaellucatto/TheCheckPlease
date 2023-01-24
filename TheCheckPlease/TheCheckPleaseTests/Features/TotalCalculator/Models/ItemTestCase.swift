//
//  ItemTestCase.swift
//  TheCheckPleaseTests
//
//  Created by Rafael Lucatto on 1/23/23.
//

import Foundation
import XCTest

@testable import TheCheckPlease

final class ItemTestCase: XCTestCase {

    var sut: Item!
    var sut2: Items!

    override func setUp() {
        super.setUp()
        sut = .init(price: 13.5, checked: true)
        sut2 = .saveAndLoad
    }

    override func tearDown() {
        sut = nil
        sut2 = nil
        super.tearDown()
    }

    func test_whenInitialized_shouldReturnExpectedValues() {
        XCTAssertEqual(sut.price, 13.5)
        XCTAssertEqual(sut.checked, true)
    }

    func test_whenInitializedForSavingData_shouldReturnExpectedString() {
        XCTAssertEqual(sut2.rawValue, "saveAndLoadItems")
    }

}
