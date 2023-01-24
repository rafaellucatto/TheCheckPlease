//
//  ErrorViewTestCase.swift
//  TheCheckPleaseTests
//
//  Created by Rafael Lucatto on 1/23/23.
//

import Foundation
import iOSSnapshotTestCase

@testable import TheCheckPlease

final class ErrorViewTestCase: FBSnapshotTestCase {

    var sut: ErrorView!
    var viewModel: ErrorViewModelProtocolSpy!

    override func setUp() {
        super.setUp()
        viewModel = .init()
        sut = .init(viewModel: viewModel)
        sut.frame = UIScreen.main.bounds
    }

    override func tearDown() {
        super.tearDown()
    }

    func test_whenInitialized_shouldReturnExpectedView() {
        FBSnapshotVerifyView(sut)
    }

}
