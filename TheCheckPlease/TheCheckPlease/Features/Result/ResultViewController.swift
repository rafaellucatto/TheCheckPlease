//
//  ResultViewController.swift
//  TheCheckPlease
//
//  Created by Rafael Lucatto on 1/23/23.
//

import Foundation
import UIKit

final class ResultViewController: UIViewController {

    let viewModel: ResultViewModelProtocol
    var resultView: ResultView

    init(viewModel: ResultViewModelProtocol) {
        self.viewModel = viewModel
        resultView = .init(viewModel: self.viewModel)
        super.init(nibName: nil, bundle: Bundle.main)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = resultView
    }

}
