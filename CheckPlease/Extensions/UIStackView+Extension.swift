//
//  UIStackView+Extension.swift
//  CheckPlease
//
//  Created by Rafael Lucatto on 1/29/24.
//

import Foundation
import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            self.addArrangedSubview(view)
        }
    }
    
}
