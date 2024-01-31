//
//  DispatchQueueHandler.swift
//  CheckPlease
//
//  Created by Rafael Lucatto on 1/30/24.
//

import Foundation

final class DispatchQueueHandler {
    
    private init() {}
    
    static func async(completion: @escaping () -> Void) {
        if ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil {
            completion()
            return
        }
        DispatchQueue.main.async {
            completion()
        }
    }
    
}
