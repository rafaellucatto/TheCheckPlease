//
//  TotalCalculatorView.swift
//  TheCheckPlease
//
//  Created by Rafael Lucatto on 1/23/23.
//

import Core
import Foundation
import UIKit

final class TotalCalculatorView: UIView {

    var viewModel: TotalCalculatorViewModelProtocol

    init(viewModel: TotalCalculatorViewModelProtocol, frame: CGRect = .zero) {
        self.viewModel = viewModel
        super.init(frame: frame)
        self.viewModel.totalCalculatorViewDelegate = self
        viewModel.setupInitialSelectedButton()
        setupEntireView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupEntireView() {
        addSubviews()
        addConstraints()
    }

    private func addSubviews() {
        addSubview(tableView)
        addSubview(stackView1)
    }

    private func setupViewForStepper() {
        viewForStepper.addSubview(peopleStepper)
    }

    private func setupStackView1Constraints() {
        stackView1.leftAnchor.constraint(equalTo: leftAnchor, constant: 0.0).isActive = true
        stackView1.topAnchor.constraint(equalTo: centerYAnchor, constant: 0.0).isActive = true
        stackView1.rightAnchor.constraint(equalTo: rightAnchor, constant: 0.0).isActive = true
        stackView1.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0.0).isActive = true
    }

    private func addConstraints() {
        setupTableViewConstraints()
        setupStackView1Constraints()
        setupViewForStepper()
        setupStepperConstraints()
        setupButtonViewSubviews()
        setupCalculateButtonConstraints()
    }

    private func setupButtonViewSubviews() {
        buttonView.addSubview(calculateButton)
    }

    private func setupStepperConstraints() {
        peopleStepper.centerYAnchor.constraint(equalTo: viewForStepper.centerYAnchor, constant: 0.0).isActive = true
        peopleStepper.centerXAnchor.constraint(equalTo: viewForStepper.centerXAnchor, constant: 0.0).isActive = true
        peopleStepper.addTarget(self, action: #selector(handlePeopleQuantity), for: .touchUpInside)
    }

    private func setupCalculateButtonConstraints() {
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.leftAnchor.constraint(equalTo: buttonView.leftAnchor, constant: 0.0).isActive = true
        calculateButton.rightAnchor.constraint(equalTo: buttonView.rightAnchor, constant: 0.0).isActive = true
        calculateButton.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor, constant: 0.0).isActive = true
    }

    @objc func handlePeopleQuantity(sender: UIStepper) {
        viewModel.handlePeopleQuantity(stepperValue: sender.value)
    }

    // MARK: - Constraints and Subviews
    private func setupTableViewConstraints() {
        tableView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0.0).isActive = true
        tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0.0).isActive = true
        tableView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0.0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: centerYAnchor, constant: 0.0).isActive = true
    }

    // MARK: - Properties
    lazy var tableView: UITableView = {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: viewModel.cellIdentifier)
        $0.separatorStyle = .singleLine
        $0.delegate = self
        $0.dataSource = self
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITableView())

    lazy var stackView1: UIStackView = {
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.axis = .vertical
        $0.backgroundColor = #colorLiteral(red: 0.9458156228, green: 0.971606195, blue: 0.9795286059, alpha: 1)
        $0.addArrangedSubview(stackView11)
        $0.addArrangedSubview(stackView12)
        $0.addArrangedSubview(buttonView)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())

    lazy var stackView11: UIStackView = {
        $0.alignment = .fill
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.addArrangedSubview(tipLabel)
        $0.addArrangedSubview(stackView111)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())

    lazy var tipLabel: UILabel = {
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.text = "Leaving any tip?"
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    lazy var percentageButtonArray: [UIButton] = {
        var buttons: [UIButton] = []
        for n in 0..<viewModel.percentageButtonQuantity {
            let button = percentageButton(viewModel.percentages[n])
            buttons.append(button)
        }
        return buttons
    }()

    lazy var stackView111: UIStackView = {
        $0.alignment = .fill
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        for button in percentageButtonArray {
            $0.addArrangedSubview(button)
        }
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())

    lazy var percentageButton: ((Int) -> UIButton) = { percentage in
        let button: UIButton = .init(type: .system)
        button.addTarget(self, action: #selector(self.highlightButtonHandler), for: .touchUpInside)
        button.setTitle("\(percentage)%", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18.0)
        button.tintColor = #colorLiteral(red: 0.1733241677, green: 0.5867868066, blue: 0.6649774909, alpha: 1)
        button.tag = percentage
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }

    lazy var stackView12: UIStackView = {
        $0.alignment = .fill
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addArrangedSubview(peopleSplittingTheBillLabel)
        $0.addArrangedSubview(stackView121)
        return $0
    }(UIStackView())

    lazy var peopleSplittingTheBillLabel: UILabel = {
        $0.textAlignment = .center
        $0.text = "People splitting the bill:"
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    lazy var stackView121: UIStackView = {
        $0.addArrangedSubview(peopleNumberLabel)
        $0.addArrangedSubview(viewForStepper)
        $0.alignment = .fill
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())

    lazy var viewForStepper: UIView = .init()

    lazy var peopleNumberLabel: UILabel = {
        $0.text = "2"
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    lazy var peopleStepper: UIStepper = {
        $0.value = 2.0
        $0.minimumValue = 0.0 // if I set it to 1.0 a glitch happens on my iPhone
        $0.maximumValue = 101.0 // the same glitch doesn't happen here, but since I'm setting the minimum value to x-1, I'd rather set the maximum value to x+1 (and then handle it with an if statement when pressing the button)
        $0.autorepeat = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStepper())

    lazy var buttonView: UIView = .init()

    @objc func calculateAmount(sender: UIButton) {
        viewModel.calculateAmount()
    }

    lazy var calculateButton: UIButton = {
        $0.addTarget(self, action: #selector(calculateAmount), for: .touchUpInside)
        $0.backgroundColor = #colorLiteral(red: 0.1733241677, green: 0.5867868066, blue: 0.6649774909, alpha: 1)
        $0.setTitle(K.TotalCalculator.calculateButtonTitle, for: .normal)
        $0.tintColor = .white
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton(type: .system))

    @objc func highlightButtonHandler(button: UIButton) {
        viewModel.handleButtonHighlight(tag: button.tag)
    }

}

extension TotalCalculatorView: TotalCalculatorViewModelDelegate {

    func setStepperValue(value: Double) {
        peopleStepper.value = value
        peopleNumberLabel.text = "\(Int(value))"
    }

    func setupInitialSelectedButton() {
        percentageButtonArray[1].isSelected = true
    }

    func reloadTableViewData() {
        tableView.reloadData()
    }

    func dismissButtonHighlight() {
        for button in percentageButtonArray {
            button.isSelected = false
        }
    }

    func highlightButton(tag: Int) {
        for button in percentageButtonArray where button.tag == tag {
            button.isSelected = true
            return
        }
    }

}

extension TotalCalculatorView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellIdentifier, for: indexPath)
        cell.textLabel?.text = "\(String(format: "%.2f", viewModel.items[indexPath.row].price))"
        cell.accessoryType = viewModel.items[indexPath.row].checked ? .checkmark : .none
        cell.backgroundColor = indexPath.row % 2 != 0 ? #colorLiteral(red: 0.9051119089, green: 0.9677419066, blue: 0.9709317088, alpha: 1) : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            viewModel.items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            viewModel.savePrices()
            tableView.reloadData()
        }
    }

}

extension TotalCalculatorView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.items[indexPath.row].checked = !viewModel.items[indexPath.row].checked
        viewModel.savePrices()
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .delete
    }

}
