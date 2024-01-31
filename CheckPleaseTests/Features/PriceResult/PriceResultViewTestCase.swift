//
//  PriceResultViewTestCase.swift
//  CheckPleaseTests
//
//  Created by Rafael Lucatto on 1/30/24.
//

import Foundation
import iOSSnapshotTestCase

@testable import CheckPlease

final class PriceResultViewTestCase: FBSnapshotTestCase {
    
    var viewModel: PriceResultViewModel!
    var sut: PriceResultView!
    
    override func setUp() {
        super.setUp()
        let total: TotalResult = TotalResult(priceTotal: 45.6, percentage: 10, peopleTotal: 2)
        viewModel = .init(totalResult: total)
        sut = .init(viewModel: viewModel)
    }
    
    override func tearDown() {
        sut = nil
        viewModel = nil
        super.tearDown()
    }
    
    
    func test_whenInitialized_shouldReturnExpectedLayout() {
        sut.frame = .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.4)
        FBSnapshotVerifyView(sut)
    }
    
}
