//
//  UIViewController+Extension.swift
//  CheckPlease
//
//  Created by Rafael Lucatto on 1/30/24.
//

import Foundation
import UIKit

extension UIViewController {
    
    func pushVC(_ vc: UIViewController, animated: Bool) {
        if let navC: UINavigationController = self as? UINavigationController {
            navC.pushViewController(vc, animated: animated.shouldAnimate())
        } else if let navC: UINavigationController = self.parent as? UINavigationController {
            navC.pushViewController(vc, animated: animated.shouldAnimate())
        }
    }
    
    func presentVC(_ vc: UIViewController, animated: Bool) {
        if let navC: UINavigationController = self as? UINavigationController, let originVC: UIViewController = navC.topViewController {
            originVC.present(vc, animated: animated.shouldAnimate())
            return
        }
        self.present(vc, animated: animated.shouldAnimate())
    }
    
}
