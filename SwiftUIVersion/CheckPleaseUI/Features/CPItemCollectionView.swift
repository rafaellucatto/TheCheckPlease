//
//  ContentView.swift
//  CheckPleaseUI
//
//  Created by Rafael Lucatto on 2/10/24.
//

import SwiftUI

struct CPItemCollectionView<ViewModel: CPItemCollectionViewModelProtocol>: View {
    
    @StateObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel = CPItemCollectionViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    VStack(spacing: 0) {
                        CPItemCellView(viewModel: viewModel)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.5)
                    VStack(spacing: 0) {
                        CPTipView(viewModel: viewModel, width: geometry.size.height / 16, height: geometry.size.height / 24)
                            .frame(height: geometry.size.height / 6)
                        CPPeopleCountView(viewModel: viewModel, width: geometry.size.width / 2)
                            .frame(height: geometry.size.height / 6)
                        CPCalculateButtonView(viewModel: viewModel, width: geometry.size.width, height: geometry.size.height / 20)
                            .frame(height: geometry.size.height / 6)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height * 0.5)
                    .background(Color(uiColor: .appBGColor))
                }
            }
            .modifier(CPToolbarModifier(viewModel: viewModel))
            .modifier(CPAlertModifier(viewModel: viewModel))
        }
        .onAppear {
            viewModel.viewDidAppear()
        }
    }
    
}

#Preview {
    CPItemCollectionView()
}
