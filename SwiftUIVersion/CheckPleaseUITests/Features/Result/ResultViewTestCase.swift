//
//  ResultViewTestCase.swift
//  CheckPleaseUITests
//
//  Created by Rafael Lucatto on 2/13/24.
//

import Foundation
import iOSSnapshotTestCase
import SwiftUI

@testable import CheckPleaseUI

final class ResultViewTestCase: FBSnapshotTestCase {
    
    var viewModel: MockCPResultViewModel!
    var sut: CPResultView<MockCPResultViewModel>!
    
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
    
    func test_whenInitialized_shouldReturnExpectedLayout() {
        let vc = UIHostingController(rootView: sut)
        let window: UIWindow = UIWindow(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2.8))
        window.rootViewController = vc
        window.makeKeyAndVisible()
        FBSnapshotVerifyView(vc.view)
    }
    
}
