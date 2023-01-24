//
//  ErrorViewModelTestCase.swift
//  TheCheckPleaseTests
//
//  Created by Rafael Lucatto on 1/23/23.
//

import Foundation
import XCTest

@testable import TheCheckPlease

final class ErrorViewModelTestCase: XCTestCase {

    var sut: ErrorViewModel!
    var delegate: ErrorViewModelDelegateSpy!

    override func setUp() {
        super.setUp()
        delegate = .init()
        sut = .init()
        sut.errorViewModelDelegate = delegate
    }

    override func tearDown() {
        sut = nil
        delegate = nil
        super.tearDown()
    }

    func test_whenDismissGetsCalled_shouldTriggerExpectedFunction() {
        sut.dismiss()
        XCTAssertEqual(delegate.dismissCount, 1)
    }

}
