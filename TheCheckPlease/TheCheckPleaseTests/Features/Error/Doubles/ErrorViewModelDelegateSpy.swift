//
//  ErrorViewModelDelegateSpy.swift
//  TheCheckPleaseTests
//
//  Created by Rafael Lucatto on 1/23/23.
//

import Foundation

@testable import TheCheckPlease

final class ErrorViewModelDelegateSpy: ErrorViewModelDelegate {

    var dismissCount: Int = 0

    func dismiss() {
        dismissCount += 1
    }

}
