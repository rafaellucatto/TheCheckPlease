//
//  CPToolbarModifier.swift
//  CheckPleaseUI
//
//  Created by Rafael Lucatto on 2/12/24.
//

import Foundation
import SwiftUI

struct CPToolbarModifier<ViewModel: CPItemCollectionViewModelProtocol>: ViewModifier {
    
    @ObservedObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        _viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    func body(content: Content) -> some View {
        content
            .navigationTitle("Check Please")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color(uiColor: .primary), for: .navigationBar)
            .toolbarBackground(.visible, for: ToolbarPlacement.navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.shouldPresentAlert = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        withAnimation {
                            viewModel.deleteAllItems()
                        }
                    } label: {
                        Image(systemName: "trash.circle")
                    }
                }
            }
    }
    
}
