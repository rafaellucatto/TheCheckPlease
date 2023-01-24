//
//  ErrorViewModel.swift
//  TheCheckPlease
//
//  Created by Rafael Lucatto on 1/23/23.
//

import Foundation

protocol ErrorViewModelProtocol {
    var errorViewModelDelegate: ErrorViewModelDelegate? { get set }
    func dismiss()
}

protocol ErrorViewModelDelegate: AnyObject {
    func dismiss()
}

final class ErrorViewModel: ErrorViewModelProtocol {

    var errorViewModelDelegate: ErrorViewModelDelegate?

    func dismiss() {
        errorViewModelDelegate?.dismiss()
    }
}
