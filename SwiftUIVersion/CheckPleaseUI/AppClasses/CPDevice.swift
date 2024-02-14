//
//  CPDevice.swift
//  CheckPleaseUI
//
//  Created by Rafael Lucatto on 2/13/24.
//

import Foundation

final class CPDevice {
    
    static func isRunningTests() -> Bool {
        return ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
    }
    
}
