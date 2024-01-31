//
//  ItemsView.swift
//  CheckPlease
//
//  Created by Rafael Lucatto on 1/29/24.
//

import Foundation
import UIKit

final class ItemsView: UIView {
    
    let viewModel: ItemsViewModelProtocol
    
    init(viewModel: ItemsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        self.viewModel.delegate = self
        backgroundColor = .white
        viewModel.percentagesAvailable.forEach { percentageButtons.append(percentageButton($0)) }
        addSubviews(wholeScreenStackView)
        percentageButtons.forEach { tipButtonArrayStackView.addArrangedSubviews($0) }
        setUpConstraints()
        deselectAllButtons()
        highlightButton(with: 10)
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private lazy var wholeScreenStackView: UIStackView = {
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.alignment = .fill
        $0.addArrangedSubviews(itemsTableView, bottomHalfScreenStackView)
        return $0
    }(UIStackView())
    
    private lazy var itemsTableView: UITableView = {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identifier)
        $0.separatorStyle = .singleLine
        $0.dataSource = viewModel
        $0.delegate = viewModel
        return $0
    }(UITableView())
    
    private lazy var bottomHalfScreenStackView: UIStackView = {
        $0.distribution = .fillEqually
        $0.axis = .vertical
        $0.alignment = .fill
        $0.backgroundColor = .appBGColor
        $0.addArrangedSubviews(bottomHalfScreen1_3StackView, bottomHalfScreen2_3StackView, bottomHalfScreen3_3StackView)
        return $0
    }(UIStackView())
    
    private lazy var bottomHalfScreen1_3StackView: UIStackView = {
        $0.distribution = .fillEqually
        $0.axis = .vertical
        $0.alignment = .fill
        $0.addArrangedSubviews(tipPercentageStackView)
        return $0
    }(UIStackView())
    
    private lazy var tipPercentageStackView: UIStackView = {
        $0.distribution = .fillEqually
        $0.axis = .vertical
        $0.alignment = .fill
        $0.addArrangedSubviews(tipLabel, tipButtonArrayStackView)
        return $0
    }(UIStackView())
    
    private let tipLabel: UILabel = {
        $0.text = "Leaving any tip?"
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 18)
        return $0
    }(UILabel())
    
    private lazy var tipButtonArrayStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.alignment = .fill
        return $0
    }(UIStackView())
    
    private lazy var percentageButtons: [UIView] = []
    
    private lazy var percentageButton: ((Int) -> UIView) = { percentage in
        let button: UIButton = .init(type: .system)
        button.addTarget(self, action: #selector(self.didTapPercentageButton), for: .touchUpInside)
        button.setTitle("\(percentage)%", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18.0)
        button.setTitleColor(.white, for: .normal)
        button.tag = percentage
        button.backgroundColor = .primary
        button.layer.cornerRadius = 4
        let buttonView: UIView = .init()
        buttonView.addSubviews(button)
        NSLayoutConstraint.activate([button.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor),
                                     button.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor),
                                     button.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.125)])
        return buttonView
    }
    
    @objc private func didTapPercentageButton(_ sender: UIButton) {
        viewModel.didTapPercentageButton(with: sender.tag)
    }
    
    private lazy var bottomHalfScreen2_3StackView: UIStackView = {
        $0.distribution = .fillEqually
        $0.axis = .vertical
        $0.alignment = .fill
        $0.addArrangedSubviews(billSplittingPeopleLabel, stepperStackView)
        return $0
    }(UIStackView())
    
    private lazy var billSplittingPeopleLabel: UILabel = {
        $0.text = "People splitting the bill:"
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    private lazy var stepperStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.alignment = .fill
        $0.addArrangedSubviews(viewForPeopleCountingStepper, peopleCountingLabel)
        return $0
    }(UIStackView())
    
    private lazy var viewForPeopleCountingStepper: UIView = {
        $0.addSubviews(peopleCountingStepper)
        NSLayoutConstraint.activate([
            peopleCountingStepper.centerXAnchor.constraint(equalTo: $0.centerXAnchor),
            peopleCountingStepper.centerYAnchor.constraint(equalTo: $0.centerYAnchor)
        ])
        return $0
    }(UIView())
    
    private lazy var peopleCountingStepper: UIStepper = {
        $0.value = 2.0
        $0.minimumValue = 0.0
        $0.maximumValue = 31.0
        $0.autorepeat = true
        $0.addTarget(self, action: #selector(handlePeopleCounter), for: .touchUpInside)
        return $0
    }(UIStepper())
    
    @objc private func handlePeopleCounter(_ sender: UIStepper) {
        viewModel.handlePeopleCounter(for: sender.value)
    }
    
    private lazy var peopleCountingLabel: UILabel = {
        $0.text = "2"
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    private lazy var bottomHalfScreen3_3StackView: UIStackView = {
        $0.distribution = .fill
        $0.axis = .vertical
        $0.alignment = .fill
        $0.addArrangedSubviews(buttonView)
        return $0
    }(UIStackView())
    
    private lazy var buttonView: UIView = {
        $0.addSubviews(calculateButton)
        NSLayoutConstraint.activate([
            calculateButton.leftAnchor.constraint(equalTo: $0.leftAnchor),
            calculateButton.rightAnchor.constraint(equalTo: $0.rightAnchor),
            calculateButton.centerYAnchor.constraint(equalTo: $0.centerYAnchor)
        ])
        return $0
    }(UIView())
    
    private lazy var calculateButton: UIButton = {
        $0.setTitle("CALCULATE", for: .normal)
        $0.backgroundColor = .primary
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 20)
        $0.addTarget(self, action: #selector(didTapCalculateButton), for: .touchUpInside)
        return $0
    }(UIButton(type: .system))
    
    @objc private func didTapCalculateButton() {
        viewModel.didTapCalculateButton()
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            wholeScreenStackView.leftAnchor.constraint(equalTo: leftAnchor),
            wholeScreenStackView.topAnchor.constraint(equalTo: topAnchor),
            wholeScreenStackView.rightAnchor.constraint(equalTo: rightAnchor),
            wholeScreenStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}

extension ItemsView: ItemsViewModelDelegate {
    
    func deselectAllButtons() {
        for view in self.percentageButtons {
            if let button: UIButton = view.subviews.first as? UIButton {
                button.setTitleColor(.primary, for: .normal)
                button.backgroundColor = .clear
            }
        }
    }
    
    func highlightButton(with tag: Int) {
        for view in self.percentageButtons {
            if let button: UIButton = view.subviews.first as? UIButton, button.tag == tag {
                button.setTitleColor(.white, for: .normal)
                button.backgroundColor = .primary
                return
            }
        }
    }
    
    func setStepperValue(value: Double) {
        peopleCountingStepper.value = value
        peopleCountingLabel.text = "\(Int(value))"
    }
    
    func reloadTable() {
        itemsTableView.reloadData()
    }
    
}
