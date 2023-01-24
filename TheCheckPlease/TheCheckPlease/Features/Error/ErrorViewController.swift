//
//  ErrorViewController.swift
//  TheCheckPlease
//
//  Created by Rafael Lucatto on 1/23/23.
//

import Foundation
import UIKit

final class ErrorViewController: UIViewController {

    var viewModel: ErrorViewModelProtocol
    let errorView: ErrorView

    init(viewModel: ErrorViewModelProtocol) {
        self.viewModel = viewModel
        errorView = .init(viewModel: self.viewModel)
        super.init(nibName: nil, bundle: Bundle.main)
        self.viewModel.errorViewModelDelegate = self
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = errorView
    }

}

extension ErrorViewController: ErrorViewModelDelegate {
    func dismiss() {
        dismiss(animated: true)
    }
}
