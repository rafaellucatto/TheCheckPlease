//
//  ResultView.swift
//  TheCheckPlease
//
//  Created by Rafael Lucatto on 1/23/23.
//

import Core
import Foundation
import UIKit

final class ResultView: UIView {

    let viewModel: ResultViewModelProtocol

    init(viewModel: ResultViewModelProtocol, frame: CGRect = .zero) {
        self.viewModel = viewModel
        super.init(frame: frame)
        backgroundColor = .white
        setupViews()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Properties
    lazy var fullSreenView: UIView = .init()
    lazy var viewForTotalLabel: UIView = .init()

    lazy var totalLabel: UILabel = {
        $0.text = K.ResultView.totalLabel
        $0.font = UIFont.systemFont(ofSize: 22.0)
        return $0
    }(UILabel())

    lazy var price: UILabel = {
        $0.text = String(format: "%.2f", viewModel.totalPerPerson)
        $0.font = UIFont.boldSystemFont(ofSize: 25.0)
        return $0
    }(UILabel())

    lazy var viewForSummary: UIView = .init()

    lazy var summary: UILabel = {
        $0.text = viewModel.summary
        $0.font = UIFont.systemFont(ofSize: 17.0)
        $0.textAlignment = .center
        return $0
    }(UILabel())

    // MARK: - Constraints
    private func setupFullScreenViewConstraints() {
        fullSreenView.translatesAutoresizingMaskIntoConstraints = false
        fullSreenView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        fullSreenView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        fullSreenView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        fullSreenView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
    }

    private func setupViewForTotalLabelConstraints() {
        viewForTotalLabel.translatesAutoresizingMaskIntoConstraints = false
        viewForTotalLabel.leftAnchor.constraint(equalTo: fullSreenView.leftAnchor, constant: 0.0).isActive = true
        viewForTotalLabel.bottomAnchor.constraint(equalTo: fullSreenView.centerYAnchor, constant: 0.0).isActive = true
        viewForTotalLabel.rightAnchor.constraint(equalTo: fullSreenView.rightAnchor, constant: 0.0).isActive = true
        viewForTotalLabel.topAnchor.constraint(equalTo: fullSreenView.topAnchor, constant: 0.0).isActive = true
    }

    private func setupTotalLabelConstraints() {
        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        totalLabel.centerXAnchor.constraint(equalTo: viewForTotalLabel.centerXAnchor).isActive = true
        totalLabel.centerYAnchor.constraint(equalTo: viewForTotalLabel.centerYAnchor).isActive = true
    }

    private func setupPriceConstraints() {
        price.translatesAutoresizingMaskIntoConstraints = false
        price.centerXAnchor.constraint(equalTo: fullSreenView.centerXAnchor).isActive = true
        price.centerYAnchor.constraint(equalTo: fullSreenView.centerYAnchor).isActive = true
    }

    private func setupViewForSummaryConstraints() {
        viewForSummary.translatesAutoresizingMaskIntoConstraints = false
        viewForSummary.leftAnchor.constraint(equalTo: fullSreenView.leftAnchor).isActive = true
        viewForSummary.rightAnchor.constraint(equalTo: fullSreenView.rightAnchor).isActive = true
        viewForSummary.bottomAnchor.constraint(equalTo: fullSreenView.bottomAnchor).isActive = true
        viewForSummary.topAnchor.constraint(equalTo: fullSreenView.centerYAnchor).isActive = true
    }

    private func setupSummaryConstraints() {
        summary.translatesAutoresizingMaskIntoConstraints = false
        summary.leftAnchor.constraint(equalTo: viewForSummary.leftAnchor).isActive = true
        summary.rightAnchor.constraint(equalTo: viewForSummary.rightAnchor).isActive = true
        summary.centerYAnchor.constraint(equalTo: viewForSummary.centerYAnchor).isActive = true
    }

    private func setupConstraints() {
        setupFullScreenViewConstraints()
        setupViewForTotalLabelConstraints()
        setupViewForSummaryConstraints()
        setupTotalLabelConstraints()
        setupPriceConstraints()
        setupSummaryConstraints()
    }

    private func setupViews() {
        addSubview(fullSreenView)
        fullSreenView.addSubview(viewForTotalLabel)
        viewForTotalLabel.addSubview(totalLabel)
        fullSreenView.addSubview(price)
        fullSreenView.addSubview(viewForSummary)
        viewForSummary.addSubview(summary)
    }

}
