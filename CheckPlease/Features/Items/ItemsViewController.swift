//
//  ItemsViewController.swift
//  CheckPlease
//
//  Created by Rafael Lucatto on 1/29/24.
//

import Foundation
import UIKit

final class ItemsViewController: UIViewController {
    
    private let itemsView: ItemsView
    
    init(itemsView: ItemsView) {
        self.itemsView = itemsView
        super.init(nibName: nil, bundle: nil)
        title = "Check Please"
        let didTapPlusButton: UIAction = .init { _ in self.itemsView.viewModel.didTapPlusButton() }
        navigationItem.rightBarButtonItem = .init(systemItem: .add, primaryAction: didTapPlusButton, menu: nil)
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func loadView() { view = itemsView }
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
}
