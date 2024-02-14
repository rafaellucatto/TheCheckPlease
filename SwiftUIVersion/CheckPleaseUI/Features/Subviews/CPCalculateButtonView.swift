//
//  CPCalculateButtonView.swift
//  CheckPleaseUI
//
//  Created by Rafael Lucatto on 2/12/24.
//

import SwiftUI

struct CPCalculateButtonView<ViewModel: CPItemCollectionViewModelProtocol>: View {
    
    @StateObject var viewModel: ViewModel
    
    @EnvironmentObject private var coordinator: CPCoordinator
    
    private let width: CGFloat
    private let height: CGFloat
    
    init(viewModel: ViewModel, width: CGFloat, height: CGFloat) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.width = width
        self.height = height
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Button {
                coordinator.present(sheet: .result(viewModel.makeCheck()))
            } label: {
                Text("CALCULATE")
                    .frame(width: width, height: height)
                    .background(Color(uiColor: .primary))
                    .foregroundStyle(.white)
            }
        }
    }
}
