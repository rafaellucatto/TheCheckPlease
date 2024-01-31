//
//  CustomNavController.swift
//  CheckPlease
//
//  Created by Rafael Lucatto on 1/29/24.
//

import Foundation
import UIKit

final class CustomNavController: UINavigationController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .lightContent
    }
    
}
