//
//  TotalCalculatorViewTestCase.swift
//  TheCheckPleaseTests
//
//  Created by Rafael Lucatto on 1/23/23.
//

import Foundation
import iOSSnapshotTestCase

@testable import TheCheckPlease

final class TotalCalculatorViewTestCase: FBSnapshotTestCase {

    var sut: TotalCalculatorView!
    var viewModel: TotalCalculatorViewModelProtocolSpy!

    override func setUp() {
        super.setUp()
        viewModel = .init()
        sut = .init(viewModel: viewModel)
        sut.frame = UIScreen.main.bounds
    }

    override func tearDown() {
        sut = nil
        viewModel = nil
        super.tearDown()
    }

    func test_whenInitialized_shouldReturnExpectedLayout() {
        sut.highlightButton(tag: 10)
        FBSnapshotVerifyView(sut)
    }

    func test_whenInitialized_withFifteenPercentButtonHighlightedAndAFewItems_shouldReturnExpectedLayout() {
        viewModel.items = [.init(price: 18.2, checked: true),
                           .init(price: 28.4, checked: true),
                           .init(price: 40.9, checked: true),
                           .init(price: 30.8, checked: true)]
        sut.highlightButton(tag: 15)
        FBSnapshotVerifyView(sut)
    }

    func test_whenInitialized_withAFewItems_shouldReturnExpectedLayout() {
        viewModel.items = [.init(price: 30.2, checked: true),
                           .init(price: 18.5, checked: false),
                           .init(price: 20.89, checked: true)]
        sut.highlightButton(tag: 10)
        FBSnapshotVerifyView(sut)
    }

}
