//
//  PriceResultViewController.swift
//  CheckPlease
//
//  Created by Rafael Lucatto on 1/30/24.
//

import Foundation
import UIKit

final class PriceResultViewController: UIViewController {
    
    private let priceResultView: PriceResultView
    
    init(priceResultView: PriceResultView) {
        self.priceResultView = priceResultView
        super.init(nibName: nil, bundle: nil)
        self.sheetPresentationController?.detents = [.custom(resolver: { context in
            return context.maximumDetentValue * 0.4
        })]
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func loadView() { view = priceResultView }
    
}
