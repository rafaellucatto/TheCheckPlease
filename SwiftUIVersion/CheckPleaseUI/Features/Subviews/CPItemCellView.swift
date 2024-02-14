//
//  ItemCellView.swift
//  CheckPleaseUI
//
//  Created by Rafael Lucatto on 2/12/24.
//

import SwiftUI

struct CPItemCellView<ViewModel: CPItemCollectionViewModelProtocol>: View {
    
    @StateObject private var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        List {
            ForEach(0..<viewModel.items.count, id: \.self) { n in
                HStack(spacing: 0) {
                    Text(viewModel.items[n].price.toString())
                    Spacer(minLength: 0)
                    Image(systemName: "checkmark")
                        .foregroundStyle(.blue)
                        .opacity(viewModel.items[n].isChecked ? 1 : 0)
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation {
                        viewModel.toggleCheckMark(for: n)
                    }
                }
                .listRowBackground(n % 2 == 0 ? Color.white : Color(uiColor: .appBGColor))
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                    Button {
                        withAnimation {
                            viewModel.removeItem(at: n)
                        }
                    } label: {
                        Text("Delete")
                    }
                    .tint(.red)
                }
                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                    Button {
                        withAnimation {
                            viewModel.duplicateItem(at: n)
                        }
                    } label: {
                        Text("Duplicate")
                    }
                    .tint(.green)
                }
            }
        }
        .listStyle(.plain)
    }
}
