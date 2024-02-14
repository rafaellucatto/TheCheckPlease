//
//  CPResultViewModel.swift
//  CheckPleaseUI
//
//  Created by Rafael Lucatto on 2/12/24.
//

import Foundation

protocol CPResultViewModelProtocol: ObservableObject {
    var totalPerPerson: String { get }
    var peopleCount: String { get }
    var tip: String { get }
}

final class CPResultViewModel: CPResultViewModelProtocol {
    
    private let check: CPCheck
    
    init(check: CPCheck) {
        self.check = check
    }
    
    var totalPerPerson: String {
        return "$" + check.totalPerPerson.toString()
    }
    
    var peopleCount: String {
        return check.peopleSplittingTheBill.description
    }
    
    var tip: String {
        return check.tip.description + "%"
    }
    
}
