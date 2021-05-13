//
//  ANavController.swift
//  CheckPlease
//
//  Created by Aleksandr Smorodov on 14.05.2021.
//

import UIKit

class ANavController: UINavigationController {
    
    fileprivate var duringPushAnimation = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        interactivePopGestureRecognizer?.delegate = self
    }
    
    deinit {
        #if DEBUG
        print("\(type(of: self)) deinit")
        #endif
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        duringPushAnimation = true
        
        super.pushViewController(viewController, animated: animated)
    }
    
    open override var childForStatusBarStyle: UIViewController? {
        return visibleViewController
    }
    
    open override var preferredStatusBarStyle: UIStatusBarStyle {
        return visibleViewController?.preferredStatusBarStyle ?? .default
    }
    
    override var prefersStatusBarHidden: Bool {
        return visibleViewController?.prefersStatusBarHidden ?? false
    }
}

extension ANavController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let nvc = navigationController as? ANavController else { return }
        
        nvc.duringPushAnimation = false
    }
}

// UIGestureRecognizerDelegate
extension ANavController {
    
    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard gestureRecognizer == interactivePopGestureRecognizer else {
            return true
        }
        
        if let vc = viewControllers.last as? INavigationVCDelegate {
            return vc.isSwipeBackEnabled && duringPushAnimation == false
        } else {
            return viewControllers.count > 1 && duringPushAnimation == false
        }
    }
}
