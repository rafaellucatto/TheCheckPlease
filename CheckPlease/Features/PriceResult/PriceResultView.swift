//
//  PriceResultView.swift
//  CheckPlease
//
//  Created by Rafael Lucatto on 1/30/24.
//

import Foundation
import UIKit

final class PriceResultView: UIView {
    
    private let viewModel: PriceResultViewModel
    
    init(viewModel: PriceResultViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        backgroundColor = .appBGColor
        addSubviews(resultView, billSplittingPeopleView)
        setUpConstraints()
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private lazy var resultLabel: UILabel = {
        $0.text = "Each person will pay:"
        $0.textColor = .white
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    private lazy var resultTotalLabel: UILabel = {
        $0.text = viewModel.total
        $0.textColor = .white
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    private lazy var resultView: UIView = {
        $0.backgroundColor = .primary
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 1
        $0.layer.shadowRadius = 2
        $0.layer.shadowOffset = CGSize(width: 0, height: 2)
        $0.layer.cornerRadius = 28
        $0.addSubviews(resultLabel)
        $0.addSubviews(resultTotalLabel)
        NSLayoutConstraint.activate([
            resultLabel.leftAnchor.constraint(equalTo: $0.leftAnchor, constant: 20),
            resultLabel.topAnchor.constraint(equalTo: $0.topAnchor),
            resultLabel.bottomAnchor.constraint(equalTo: $0.bottomAnchor),
            resultTotalLabel.rightAnchor.constraint(equalTo: $0.rightAnchor, constant: -20),
            resultTotalLabel.topAnchor.constraint(equalTo: $0.topAnchor),
            resultTotalLabel.bottomAnchor.constraint(equalTo: $0.bottomAnchor)
        ])
        return $0
    }(UIView())
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            resultView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            resultView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            resultView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            resultView.heightAnchor.constraint(equalToConstant: 60),
            billSplittingPeopleView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            billSplittingPeopleView.topAnchor.constraint(equalTo: resultView.bottomAnchor, constant: 40),
            billSplittingPeopleView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            billSplittingPeopleView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
    }
    
    private lazy var billSplittingPeopleView: UIView = {
        $0.backgroundColor = .white
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.primary.cgColor
        $0.layer.masksToBounds = true
        $0.layer.cornerRadius = 18
        let separator: UIView = .init()
        separator.backgroundColor = .gray
        $0.addSubviews(peopleCounterView, percentageView, separator)
        NSLayoutConstraint.activate([
            peopleCounterView.topAnchor.constraint(equalTo: $0.topAnchor),
            peopleCounterView.leftAnchor.constraint(equalTo: $0.leftAnchor),
            peopleCounterView.rightAnchor.constraint(equalTo: $0.rightAnchor),
            peopleCounterView.bottomAnchor.constraint(equalTo: $0.centerYAnchor),
            percentageView.topAnchor.constraint(equalTo: peopleCounterView.bottomAnchor),
            percentageView.leftAnchor.constraint(equalTo: $0.leftAnchor),
            percentageView.rightAnchor.constraint(equalTo: $0.rightAnchor),
            percentageView.bottomAnchor.constraint(equalTo: $0.bottomAnchor),
            separator.heightAnchor.constraint(equalToConstant: 1),
            separator.rightAnchor.constraint(equalTo: $0.rightAnchor, constant: -30),
            separator.leftAnchor.constraint(equalTo: $0.leftAnchor, constant: 30),
            separator.centerYAnchor.constraint(equalTo: $0.centerYAnchor)
        ])
        return $0
    }(UIView())
    
    private lazy var peopleCounterView: UIView = {
        $0.backgroundColor = .white
        $0.addSubviews(peopleCounter, peopleCounterTotal)
        NSLayoutConstraint.activate([
            peopleCounter.leftAnchor.constraint(equalTo: $0.leftAnchor, constant: 30),
            peopleCounter.topAnchor.constraint(equalTo: $0.topAnchor),
            peopleCounter.bottomAnchor.constraint(equalTo: $0.bottomAnchor),
            peopleCounterTotal.rightAnchor.constraint(equalTo: $0.rightAnchor, constant: -30),
            peopleCounterTotal.topAnchor.constraint(equalTo: $0.topAnchor),
            peopleCounterTotal.bottomAnchor.constraint(equalTo: $0.bottomAnchor)
        ])
        return $0
    }(UIView())
    
    private lazy var peopleCounter: UILabel = {
        $0.text = "Total of people paying:"
        $0.textColor = .black
        $0.textAlignment = .left
        return $0
    }(UILabel())
    
    private lazy var peopleCounterTotal: UILabel = {
        $0.text = viewModel.people
        $0.textColor = .black
        $0.textAlignment = .right
        return $0
    }(UILabel())
    
    private lazy var percentageView: UIView = {
        $0.addSubviews(percentageText, percentageValue)
        NSLayoutConstraint.activate([
            percentageText.leftAnchor.constraint(equalTo: $0.leftAnchor, constant: 30),
            percentageText.topAnchor.constraint(equalTo: $0.topAnchor),
            percentageText.bottomAnchor.constraint(equalTo: $0.bottomAnchor),
            percentageValue.rightAnchor.constraint(equalTo: $0.rightAnchor, constant: -30),
            percentageValue.topAnchor.constraint(equalTo: $0.topAnchor),
            percentageValue.bottomAnchor.constraint(equalTo: $0.bottomAnchor)
        ])
        return $0
    }(UIView())
    
    private lazy var percentageText: UILabel = {
        $0.textColor = .black
        $0.text = "With a tip of:"
        $0.textAlignment = .left
        return $0
    }(UILabel())
    
    private lazy var percentageValue: UILabel = {
        $0.textColor = .black
        $0.text = viewModel.percentage
        $0.textAlignment = .right
        return $0
    }(UILabel())
    
}
