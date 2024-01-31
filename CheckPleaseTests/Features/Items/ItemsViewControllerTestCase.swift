//
//  ItemsViewControllerTestCase.swift
//  CheckPleaseTests
//
//  Created by Rafael Lucatto on 1/30/24.
//

import Foundation
import iOSSnapshotTestCase

@testable import CheckPlease

final class ItemsViewControllerTestCase: FBSnapshotTestCase {
    
    var viewModel: ItemsViewModel!
    var view: ItemsView!
    var sut: ItemsViewController!
    
    override func setUp() {
        super.setUp()
        viewModel = ItemsViewModel()
        view = .init(viewModel: viewModel)
        sut = .init(itemsView: view)
    }
    
    override func tearDown() {
        sut = nil
        view = nil
        viewModel = nil
        super.tearDown()
    }
    
    func test_whenInitialized_shouldReturnExpectedLayout() {
        FBSnapshotVerifyViewController(sut)
        XCTAssertTrue(sut.view is ItemsView)
    }
    
    func test_whenInitializedWithSomeValues_shouldReturnExpectedLayout() {
        viewModel.items = [Item(price: 15.32, isChecked: true),
                           Item(price: 14.8, isChecked: false),
                           Item(price: 24.9, isChecked: false),
                           Item(price: 30.99, isChecked: true),
                           Item(price: 9.8, isChecked: true)]
        FBSnapshotVerifyViewController(sut)
    }
    
    func test_whenInitializedWithSomeValuesWith15PercentageFor1Person_shouldReturnExpectedLayout() {
        viewModel.didTapPercentageButton(with: 15)
        viewModel.handlePeopleCounter(for: 1)
        viewModel.items = [Item(price: 18.8, isChecked: true),
                           Item(price: 10.0, isChecked: false),
                           Item(price: 25.9, isChecked: true)]
        FBSnapshotVerifyViewController(sut)
    }
    
}
