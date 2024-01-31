//
//  UINavigationController+Extension.swift
//  CheckPlease
//
//  Created by Rafael Lucatto on 1/29/24.
//

import Foundation
import UIKit

extension UINavigationController {

    public func setUpNavigationBar() {
        let appearance: UINavigationBarAppearance = .init()
        appearance.configureWithOpaqueBackground()
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        appearance.backgroundColor = .primary
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = self.navigationBar.standardAppearance
        self.navigationBar.tintColor = .white
    }

}
