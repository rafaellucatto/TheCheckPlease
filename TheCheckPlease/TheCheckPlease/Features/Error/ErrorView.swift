//
//  ErrorView.swift
//  TheCheckPlease
//
//  Created by Rafael Lucatto on 1/23/23.
//

import Core
import Foundation
import UIKit

final class ErrorView: UIView {

    let viewModel: ErrorViewModelProtocol

    init(viewModel: ErrorViewModelProtocol, frame: CGRect = .zero) {
        self.viewModel = viewModel
        super.init(frame: frame)
        backgroundColor = .white
        addSubviews()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func _dismiss(sender: UIButton) {
        viewModel.dismiss()
    }

    //MARK: - Properties
    lazy var _label: UILabel = {
        $0.text = K.ErrorView.mainLabel
        return $0
    }(UILabel())

    lazy var halfScreenView: UIView = .init()

    lazy var aThirdOftheHalfScreenView: UIStackView = {
        $0.alignment = .fill
        $0.axis = .vertical
        $0.distribution = .fillEqually
        return $0
    }(UIStackView())

    lazy var emptyView: UIView = .init()

    lazy var emptyView2: UIView = .init()

    lazy var buttonView: UIView = .init()

    lazy var dismissButton: UIButton = {
        $0.setTitle(K.ErrorView.dismissButton, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 20.0)
        $0.backgroundColor = #colorLiteral(red: 0.1733241677, green: 0.5867868066, blue: 0.6649774909, alpha: 1)
        $0.addTarget(self, action: #selector(_dismiss), for: .touchUpInside)
        $0.tintColor = .white
        return $0
    }(UIButton(type: .system))

    // MARK: - Constraints
    private func setupLabelConstraints() {
        _label.translatesAutoresizingMaskIntoConstraints = false
        _label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        _label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }

    private func setupHalfScreenViewConstraints() {
        halfScreenView.translatesAutoresizingMaskIntoConstraints = false
        halfScreenView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        halfScreenView.topAnchor.constraint(equalTo: centerYAnchor).isActive = true
        halfScreenView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        halfScreenView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    private func setupThirdHalfStackViewConstraints() {
        aThirdOftheHalfScreenView.translatesAutoresizingMaskIntoConstraints = false
        aThirdOftheHalfScreenView.leftAnchor.constraint(equalTo: halfScreenView.leftAnchor).isActive = true
        aThirdOftheHalfScreenView.topAnchor.constraint(equalTo: halfScreenView.topAnchor).isActive = true
        aThirdOftheHalfScreenView.rightAnchor.constraint(equalTo: halfScreenView.rightAnchor).isActive = true
        aThirdOftheHalfScreenView.bottomAnchor.constraint(equalTo: halfScreenView.bottomAnchor).isActive = true
    }

    private func setupDismissButtonConstraints() {
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor).isActive = true
        dismissButton.leftAnchor.constraint(equalTo: buttonView.leftAnchor).isActive = true
        dismissButton.rightAnchor.constraint(equalTo: buttonView.rightAnchor).isActive = true
    }

    private func addSubviews() {
        addSubview(_label)
        addSubview(halfScreenView)
        halfScreenView.addSubview(aThirdOftheHalfScreenView)
        aThirdOftheHalfScreenView.addArrangedSubview(emptyView)
        aThirdOftheHalfScreenView.addArrangedSubview(emptyView2)
        aThirdOftheHalfScreenView.addArrangedSubview(buttonView)
        buttonView.addSubview(dismissButton)
    }

    private func setupConstraints() {
        setupLabelConstraints()
        setupHalfScreenViewConstraints()
        setupThirdHalfStackViewConstraints()
        setupDismissButtonConstraints()
    }

}
