//
//  SpyCPUserDetauls.swift
//  CheckPleaseUITests
//
//  Created by Rafael Lucatto on 2/13/24.
//

import Foundation

@testable import CheckPleaseUI

final class SpyCPUserDetauls: CPUserDefaultsProtocol {
    
    static var shared: SpyCPUserDetauls = SpyCPUserDetauls()
    
    var shouldLoadItems: Bool
    var itemsToLoad: [CPItem]
    
    init(shouldLoadItems: Bool = true, itemsToLoad: [CPItem] = []) {
        self.shouldLoadItems = shouldLoadItems
        self.itemsToLoad = itemsToLoad
    }
    
    private(set) var didCallSaveData: Bool = false
    private(set) var didCallLoadData: Bool = false
    
    func saveData(data: Data) {
        didCallSaveData = true
    }
    
    func loadData() -> Data? {
        didCallLoadData = true
        if shouldLoadItems, let data: Data = try? JSONEncoder().encode(self.itemsToLoad) {
            return data
        }
        return nil
    }
    
}
