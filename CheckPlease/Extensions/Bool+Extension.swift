//
//  Bool+Extension.swift
//  CheckPlease
//
//  Created by Rafael Lucatto on 1/30/24.
//

import Foundation

extension Bool {
    
    func shouldAnimate() -> Bool {
        if ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil {
            return false
        }
        return self
    }
    
}
