//
//  CPCoordinatorTestCase.swift
//  CheckPleaseUITests
//
//  Created by Rafael Lucatto on 2/14/24.
//

import Foundation
import SwiftUI
import XCTest

@testable import CheckPleaseUI

final class CPCoordinatorTestCase: XCTestCase {
    
    var sut: CPCoordinator!
    
    override func setUp() {
        super.setUp()
        sut = CPCoordinator()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_whenBuildingItemCollectionPage_shouldReturnExpectedPage() {
        let view: some View = sut.build(page: .itemCollection)
        XCTAssertTrue(type(of: view) == CPItemCollectionView<CPItemCollectionViewModel>.self)
    }
    
    func test_whenBuildingResultSheet_shouldReturnExpectedPage() {
        let view: some View = sut.build(sheet: .result(CPCheck(totalPerPerson: 0, peopleSplittingTheBill: 0, tip: 0)))
        XCTAssertTrue(type(of: view) == CPResultView<CPResultViewModel>.self)
    }
    
    func test_whenPresentingSheet_shouldReturnExpectedViewId() {
        sut.present(sheet: .result(CPCheck(totalPerPerson: 0, peopleSplittingTheBill: 0, tip: 0)))
        XCTAssertEqual(sut.sheet?.id, Sheet.result(CPCheck(totalPerPerson: 0, peopleSplittingTheBill: 0, tip: 0)).id)
    }
    
}
