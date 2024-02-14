//
//  CPPeopleCountView.swift
//  CheckPleaseUI
//
//  Created by Rafael Lucatto on 2/12/24.
//

import SwiftUI

struct CPPeopleCountView<ViewModel: CPItemCollectionViewModelProtocol>: View {
    
    @StateObject var viewModel: ViewModel
    
    private let width: CGFloat
    
    init(viewModel: ViewModel, width: CGFloat) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.width = width
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            Text("People splitting the bill:")
            Spacer()
            HStack(spacing: 0) {
                Stepper(value: $viewModel.peopleSplittingTheBill, in: 1...15, step: 1) {
                    Text(viewModel.peopleSplittingTheBill.description)
                }
                .frame(width: width)
            }
            Spacer()
        }
    }
}
