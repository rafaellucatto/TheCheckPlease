//
//  CPResultView.swift
//  CheckPleaseUI
//
//  Created by Rafael Lucatto on 2/10/24.
//

import SwiftUI

struct CPResultView<ViewModel: CPResultViewModelProtocol>: View {
    
    @ObservedObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        _viewModel = ObservedObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .center, spacing: 0) {
                // MARK: - principal area
                HStack(spacing: 0) {
                    Text("Each person will pay:")
                    Spacer(minLength: 0)
                    Text(viewModel.totalPerPerson)
                }
                .padding(14)
                .frame(width: proxy.size.width / 1.2)
                .background(Color(uiColor: .primary))
                .clipShape(.rect(cornerRadius: 22))
                .foregroundStyle(.white)
                .shadow(color: .black, radius: 3)
                VStack(spacing: 0) {
                    Spacer(minLength: 0)
                    HStack(spacing: 0) {
                        Text("Total of people paying:")
                        Spacer(minLength: 0)
                        Text(viewModel.peopleCount)
                    }
                    Spacer(minLength: 0)
                    Divider()
                    Spacer(minLength: 0)
                    HStack(spacing: 0) {
                        Text("With a tip of:")
                        Spacer(minLength: 0)
                        Text(viewModel.tip)
                    }
                    Spacer(minLength: 0)
                }
                .padding()
                .frame(width: proxy.size.width / 1.2, height: 120)
                .background(Color.white)
                .clipShape(.rect(cornerRadius: 22))
                .overlay {
                    RoundedRectangle(cornerSize: CGSize(width: 22, height: 22))
                        .stroke(Color(uiColor: .primary), lineWidth: 1.2)
                }
                .frame(height: 200)
            }
            .frame(width: proxy.size.width, height: proxy.size.height)
            .padding(.vertical)
        }
        .background(Color(uiColor: .appBGColor))
        .presentationDetents([.height(260)])
    }
}

//#Preview {
//    ResultView(totalPerPerson: 11.54, peopleSplittingTheBill: 2, tip: 10)
//}
