//
//  CPCoordinator.swift
//  CheckPleaseUI
//
//  Created by Rafael Lucatto on 2/12/24.
//

import Foundation
import SwiftUI

enum Page: String, Identifiable {
    
    case itemCollection
    
    var id: String {    
        return self.rawValue
    }
    
}

enum Sheet: Identifiable {
    
    case result(CPCheck)
    
    var id: String {
        switch self {
        case .result:
            return "theCheck"
        }
    }
    
}

final class CPCoordinator: ObservableObject {
    
    @Published var path: NavigationPath = NavigationPath()
    @Published var sheet: Sheet?
    @Published var page: Page?
    
    func present(sheet: Sheet) {
        self.sheet = sheet
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    @ViewBuilder
    func build(sheet: Sheet) -> some View {
        switch sheet {
        case .result(let check):
            let viewModel = CPResultViewModel(check: check)
            CPResultView(viewModel: viewModel)
        }
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .itemCollection:
            CPItemCollectionView()
        }
    }
    
}
