//
//  CPUserDefaults.swift
//  CheckPleaseUI
//
//  Created by Rafael Lucatto on 2/13/24.
//

import Foundation

protocol CPUserDefaultsProtocol {
    static var shared: Self { get }
    func saveData(data: Data)
    func loadData() -> Data?
}

final class CPUserDefaults: CPUserDefaultsProtocol {
    
    static let shared: CPUserDefaults = CPUserDefaults()
    
    private init() {}
    
    func saveData(data: Data) {
        guard !CPDevice.isRunningTests() else { return }
        UserDefaults.standard.setValue(data, forKey: DataSaving.key.rawValue)
    }
    
    func loadData() -> Data? {
        if !CPDevice.isRunningTests(), let data: Data = UserDefaults.standard.object(forKey: DataSaving.key.rawValue) as? Data {
            return data
        }
        return nil
    }
    
    private enum DataSaving: String {
        case key = "dataSavingAndLoading"
    }
    
}
