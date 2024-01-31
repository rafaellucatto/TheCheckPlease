//
//  AppCoordinatorTestCase.swift
//  CheckPleaseTests
//
//  Created by Rafael Lucatto on 1/30/24.
//

import Foundation
import XCTest

@testable import CheckPlease

final class AppCoordinatorTestCase: XCTestCase {
    
    var window: UIWindow!
    var sut: AppCoordinator!
    
    override func setUp() {
        super.setUp()
        window = .init(frame: .zero)
        sut = .init(window: window)
        sut.start()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        window = nil
    }
    
    func test_whenStarted_shouldReturnExpectedViewController() {
        XCTAssertTrue(sut.viewController is UINavigationController)
    }
    
    func test_whenPresentingAlert_shouldReturnExpectedViewController() {
        sut.start()
        sut.presentAlert(UIAlertController(title: "title", message: "message", preferredStyle: .alert), animated: false)
        guard let navC: UINavigationController = sut.viewController as? UINavigationController else {
            XCTFail("Unable to get viewController as navigationController")
            return
        }
        XCTAssertTrue(navC.presentedViewController is UIAlertController)
    }
    
    func test_whenTappingCalculate_shouldReturnExpectedViewController() {
        sut.start()
        sut.didTapCalculate(with: .stub())
        guard let navC: UINavigationController = sut.viewController as? UINavigationController else {
            XCTFail("Unable to get viewController as navigationController")
            return
        }
        XCTAssertTrue(navC.presentedViewController is PriceResultViewController)
    }
    
}
