//
//  ItemCollectionViewTestCase.swift
//  CheckPleaseUITests
//
//  Created by Rafael Lucatto on 2/12/24.
//

import Foundation
import iOSSnapshotTestCase
import SwiftUI

@testable import CheckPleaseUI

final class ItemCollectionViewTestCase: FBSnapshotTestCase {
    
    var viewModel: MockCPItemCollectionViewModel!
    var sut: CPItemCollectionView<MockCPItemCollectionViewModel>!
    
    override func setUp() {
        super.setUp()
        viewModel = .init()
        sut = CPItemCollectionView(viewModel: viewModel)
    }
    
    override func tearDown() {
        sut = nil
        viewModel = nil
        super.tearDown()
    }
    
    func test_whenInitialized_shouldReturnExpectedLayout() {
        let vc: UIHostingController<CPItemCollectionView> = UIHostingController(rootView: sut)
        createWindow(with: vc)
        FBSnapshotVerifyViewController(vc)
    }

    func test_whenInputtingSomeItems_withTipOf15_for3People_shouldReturnExpectedLayout() {
        viewModel.items = [CPItem(price: 17.8, isChecked: true),
                           CPItem(price: 9.9, isChecked: true),
                           CPItem(price: 34.2, isChecked: true),
                           CPItem(price: 23.1, isChecked: false),
                           CPItem(price: 21.9, isChecked: true)]
        viewModel.chosenPercentage = 15
        viewModel.peopleSplittingTheBill = 3
        let vc: UIHostingController<CPItemCollectionView> = UIHostingController(rootView: sut)
        createWindow(with: vc)
        FBSnapshotVerifyViewController(vc)
    }
    
    private func createWindow(with controller: UIViewController) {
        let window: UIWindow = UIWindow(frame: CGRect(x: 0, y: -1, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        window.rootViewController = controller
        window.makeKeyAndVisible()
    }
    
}
