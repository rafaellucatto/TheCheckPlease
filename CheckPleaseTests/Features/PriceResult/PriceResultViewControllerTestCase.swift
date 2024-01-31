//
//  PriceResultViewControllerTestCase.swift
//  CheckPleaseTests
//
//  Created by Rafael Lucatto on 1/30/24.
//

import Foundation
import XCTest

@testable import CheckPlease

final class PriceResultViewControllerTestCase: XCTestCase {
    
    var viewModel: PriceResultViewModel!
    var view: PriceResultView!
    var sut: PriceResultViewController!
    
    override func setUp() {
        super.setUp()
        let total: TotalResult = TotalResult(priceTotal: 45.6, percentage: 10, peopleTotal: 2)
        viewModel = .init(totalResult: total)
        view = .init(viewModel: viewModel)
        sut = .init(priceResultView: view)
    }
    
    override func tearDown() {
        sut = nil
        view = nil
        viewModel = nil
        super.tearDown()
    }
    
    
    func test_whenInitialized_shouldReturnExpectedLayout() {
        XCTAssertTrue(sut.view is PriceResultView)
    }
    
}
