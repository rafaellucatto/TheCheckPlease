//
//  ResultViewControllerTestCase.swift
//  TheCheckPleaseTests
//
//  Created by Rafael Lucatto on 1/23/23.
//

import Foundation
import XCTest

@testable import TheCheckPlease

final class ResultViewControllerTestCase: XCTestCase {

    var sut: ResultViewController!
    var viewModel: ResultViewModelProtocolSpy!

    override func setUp() {
        super.setUp()
        viewModel = .init()
        sut = .init(viewModel: viewModel)
    }

    override func tearDown() {
        sut = nil
        viewModel = nil
        super.tearDown()
    }

    func test_whenInitialized_shouldHaveExpectedView() {
        XCTAssertTrue(sut.view is ResultView)
    }

}
