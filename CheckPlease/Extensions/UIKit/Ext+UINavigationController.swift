//
//  Ext+UINavigationController.swift
//  CheckPlease
//
//  Created by Aleksandr Smorodov on 14.05.2021.
//

import UIKit

extension UINavigationController {
    
    convenience public init(rootVCType type: UIViewController.Type) {
        let vc = type.initializeFromNib() ?? type.init()
        self.init(rootViewController: vc)
    }
}

extension UINavigationController: UIGestureRecognizerDelegate {
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        true
    }
}
