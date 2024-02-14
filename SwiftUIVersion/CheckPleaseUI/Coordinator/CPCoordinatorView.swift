//
//  CPCoordinatorView.swift
//  CheckPleaseUI
//
//  Created by Rafael Lucatto on 2/12/24.
//

import SwiftUI

struct CPCoordinatorView: View {
    
    @StateObject private var coordinator: CPCoordinator = CPCoordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .itemCollection)
                .navigationDestination(for: Page.self) { page in
                    coordinator.build(page: page)
                }
                .sheet(item: $coordinator.sheet) { sheet in
                    coordinator.build(sheet: sheet)
                }
        }
        .environmentObject(coordinator)
    }
}

#Preview {
    CPCoordinatorView()
}
