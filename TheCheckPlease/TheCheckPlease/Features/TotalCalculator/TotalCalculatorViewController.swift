//
//  TotalCalculatorViewController.swift
//  TheCheckPlease
//
//  Created by Rafael Lucatto on 1/23/23.
//

import Foundation
import UIKit

final class TotalCalculatorViewController: UIViewController {

    let viewModel: TotalCalculatorViewModelProtocol

    var totalCalculatorView: TotalCalculatorView
    var coordinatorDelegate: CoordinatorDelegate?

    init(viewModel: TotalCalculatorViewModelProtocol) {
        self.viewModel = viewModel
        totalCalculatorView = .init(viewModel: self.viewModel)
        super.init(nibName: nil, bundle: Bundle.main)
        title = viewModel.viewTitle
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.rightBarButtonItem = .init(image: UIImage(systemName: "plus"),
                                                  style: .done,
                                                  target: self,
                                                  action: #selector(addItem))
        navigationItem.rightBarButtonItem?.tintColor = .white
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = totalCalculatorView
    }

    @objc func addItem() {
        viewModel.presentAlert()
    }

}
