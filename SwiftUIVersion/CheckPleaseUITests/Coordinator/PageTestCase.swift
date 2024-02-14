//
//  PageTestCase.swift
//  CheckPleaseUITests
//
//  Created by Rafael Lucatto on 2/14/24.
//

import Foundation
import XCTest

@testable import CheckPleaseUI

final class PageTestCase: XCTestCase {
    
    var sut: Page!
    
    override func setUp() {
        super.setUp()
        sut = .itemCollection
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_whenInitialized_shouldReturnExpectedId() {
        XCTAssertEqual(sut.id, "itemCollection")
    }
    
}
