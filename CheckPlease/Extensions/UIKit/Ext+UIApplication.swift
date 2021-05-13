//
//  Ext+UIApplication.swift
//  CheckPlease
//
//  Created by Aleksandr Smorodov on 14.05.2021.
//

import UIKit

extension UIApplication {
    
    var mainWindow: UIWindow? {
        return UIApplication.shared.delegate?.window ?? nil
    }
    
    var rootViewController: UIViewController? {
        get { return mainWindow?.rootViewController }
        set { mainWindow?.rootViewController = newValue }
    }
    
    class func topVC(base: UIViewController? = UIApplication.shared.mainWindow?.rootViewController) -> UIViewController? {
        
        if let nav = base as? UINavigationController {
            return topVC(base: nav.visibleViewController)
            
        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return topVC(base: selected)
            
        } else if let presented = base?.presentedViewController {
            return topVC(base: presented)
        }
        return base
    }
    
    var isSimulator: Bool {
        #if targetEnvironment(simulator)
        return true
        
        #else
        return false
        #endif
    }
    
    func open(url: URL?, options: [UIApplication.OpenExternalURLOptionsKey : Any] = [:], completionHandler completion: ((Bool) -> Void)? = nil) {
        
        guard let url = url, canOpenURL(url) else { return }
        
        if #available(iOS 10.0, *) {
            open(url, options: options, completionHandler: completion)
        } else {
            openURL(url)
            completion?(true)
        }
    }
}
