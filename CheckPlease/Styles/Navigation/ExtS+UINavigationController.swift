//
//  ExtS+UINavigationController.swift
//  CheckPlease
//
//  Created by Aleksandr Smorodov on 14.05.2021.
//

import UIKit

extension UINavigationController {
    
    func styleNavbar(hidden: Bool, isTranslucent: Bool = false, bgColor: UIColor = .white, tintColor: UIColor = .black, titleColor: UIColor = .black) {
        
        navigationBar.isTranslucent = isTranslucent
        
        if isTranslucent {
            navigationBar.barTintColor = nil
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            view.backgroundColor = .clear
            
            navigationBar.addSplashBg(bgColor)
        } else {
            if let bgImage = UIImage.origImg("navbar") {
                navigationBar.barTintColor = nil
                navigationBar.setBackgroundImage(bgImage.resizableImage(withCapInsets: UIEdgeInsets.init(top: 0, left: 0, bottom: 44, right: 0), resizingMode: UIImage.ResizingMode.stretch), for: UIBarMetrics.default)
            } else {
                navigationBar.barTintColor = bgColor
                navigationBar.setBackgroundImage(nil, for: .default)
            }
        }
        navigationBar.tintColor = tintColor
        
        navigationBar.barStyle = .black
        navigationBar.shadowImage = UIImage()
        
        navigationBar.titleTextAttributes = [.foregroundColor: titleColor, .font: UIFont.Style.system.font(ofSize: 18, weight: .bold)]
        
        setNavigationBarHidden(hidden, animated: true)
    }
}
