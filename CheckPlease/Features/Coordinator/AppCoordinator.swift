//
//  AppCoordinator.swift
//  CheckPlease
//
//  Created by Rafael Lucatto on 1/29/24.
//

import Foundation
import UIKit

protocol BaseCoordinator {
    var viewController: UIViewController? { get }
    func start()
}

final class AppCoordinator: BaseCoordinator {
    
    private let window: UIWindow?
    
    var viewController: UIViewController?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let viewModel: ItemsViewModelProtocol = ItemsViewModel()
        viewModel.screenDelegate = self
        let view: ItemsView = .init(viewModel: viewModel)
        let vc: ItemsViewController = .init(itemsView: view)
        let navC: CustomNavController = .init(rootViewController: vc)
        navC.setUpNavigationBar()
        self.viewController = navC
        window?.rootViewController = self.viewController
        window?.makeKeyAndVisible()
    }
    
}

extension AppCoordinator: ItemsViewModelScreenDelegate {
    
    func presentAlert(_ alert: UIAlertController, animated: Bool) {
        viewController?.presentVC(alert, animated: animated)
    }
    
    func didTapCalculate(with total: TotalResult) {
        let viewModel: PriceResultViewModel = .init(totalResult: total)
        let view: PriceResultView = .init(viewModel: viewModel)
        let vc: PriceResultViewController = .init(priceResultView: view)
        viewController?.presentVC(vc, animated: true)
    }
    
}
