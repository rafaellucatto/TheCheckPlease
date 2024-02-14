//
//  MockResultViewModel.swift
//  CheckPleaseUITests
//
//  Created by Rafael Lucatto on 2/13/24.
//

import Foundation

@testable import CheckPleaseUI

final class MockCPResultViewModel: CPResultViewModelProtocol {
    
    var totalPerPerson: String = "$39.50"
    var peopleCount: String = "2"
    var tip: String = "10%"
    
}
