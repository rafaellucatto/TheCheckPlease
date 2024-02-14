//
//  CPAlertModifier.swift
//  CheckPleaseUI
//
//  Created by Rafael Lucatto on 2/12/24.
//

import Foundation
import SwiftUI

struct CPAlertModifier<ViewModel: CPItemCollectionViewModelProtocol>: ViewModifier {
    
    @StateObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    func body(content: Content) -> some View {
        content
            .alert("Item price", isPresented: $viewModel.shouldPresentAlert) {
                TextField("", text: $viewModel.itemText, prompt: Text("30.90"))
                    .keyboardType(.decimalPad)
                Button {
                    viewModel.didTapAdd()
                } label: {
                    Text("Add")
                }
                Button {
                    viewModel.didTapCancel()
                } label: {
                    Text("Cancel")
                }
            }
    }
    
}
