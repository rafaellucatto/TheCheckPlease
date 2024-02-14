//
//  CPTipView.swift
//  CheckPleaseUI
//
//  Created by Rafael Lucatto on 2/12/24.
//

import SwiftUI

struct CPTipView<ViewModel>: View where ViewModel: CPItemCollectionViewModelProtocol {
    
    @StateObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel, width: CGFloat, height: CGFloat) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.width = width
        self.height = height
    }
    
    private let percentages: [Int] = [0, 10, 15, 20]
    
    private let width: CGFloat
    private let height: CGFloat
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            Text("Leaving any tip?")
            Spacer()
            HStack {
                ForEach(percentages, id: \.self) { percentage in
                    Spacer()
                    Button {
                        viewModel.chosenPercentage = percentage
                    } label: {
                        if percentage == viewModel.chosenPercentage {
                            Color(uiColor: .primary)
                                .frame(width: width, height: height)
                                .clipShape(RoundedRectangle(cornerRadius: 4))
                                .overlay {
                                    Text(percentage.description + "%")
                                        .foregroundStyle(Color(uiColor: .appBGColor))
                                }
                        } else {
                            Color.clear
                                .frame(width: width, height: height)
                                .clipShape(RoundedRectangle(cornerRadius: 4))
                                .overlay {
                                    Text(percentage.description + "%")
                                        .foregroundStyle(Color(uiColor: .primary))
                                }
                        }
                    }
                }
                Spacer()
            }
            Spacer()
        }
    }
}
