//
//  Coordinator.swift
//  TheCheckPlease
//
//  Created by Rafael Lucatto on 1/23/23.
//

import Foundation
import UIKit

protocol CoordinatorProtocol {
    var navigationController: UINavigationController { get set }
    var window: UIWindow { get set }
    func start()
}

protocol CoordinatorDelegate: AnyObject {
    func presentAlert(_ alert: UIAlertController)
    func presentError()
    func presentResult(total: Double, peopleSplittingTheBill: Double, tipPercentage: Double)
}

final class Coordinator: CoordinatorProtocol {

    var navigationController: UINavigationController
    var window: UIWindow

    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
    }

    func start() {
        var viewModel: TotalCalculatorViewModelProtocol = TotalCalculatorViewModel()
        viewModel.coordinatorDelegate = self
        let totalCalculatorViewController: TotalCalculatorViewController = .init(viewModel: viewModel)
        totalCalculatorViewController.coordinatorDelegate = self
        navigationController.pushViewController(totalCalculatorViewController, animated: false)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }

}

extension Coordinator: CoordinatorDelegate {

    func presentAlert(_ alert: UIAlertController) {
        navigationController.present(alert, animated: true)
    }

    func presentResult(total: Double, peopleSplittingTheBill: Double, tipPercentage: Double) {
        let result: Result = .init(total: total,
                                   peopleSplittingTheBill: peopleSplittingTheBill,
                                   tipPercentage: tipPercentage)
        let viewModel: ResultViewModelProtocol = ResultViewModel(result: result)
        let resultViewController: ResultViewController = .init(viewModel: viewModel)
        navigationController.pushViewController(resultViewController, animated: true)
    }

    func presentError() {
        let viewModel: ErrorViewModelProtocol = ErrorViewModel()
        let errorViewController: ErrorViewController = .init(viewModel: viewModel)
        navigationController.present(errorViewController, animated: true)
    }

}
