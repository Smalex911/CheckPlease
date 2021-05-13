//
//  ExtS+UINavigationBar.swift
//  CheckPlease
//
//  Created by Aleksandr Smorodov on 14.05.2021.
//

import UIKit

extension UINavigationBar {
    
    func addSplashBg(_ color: UIColor) {
        viewWithTag(123123)?.removeFromSuperview()
        
        let statusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.height
        
        var blurFrame = bounds
        blurFrame.size.height += statusBarHeight
        blurFrame.origin.y -= statusBarHeight
        
        let bgView  = UIView(frame: blurFrame)
        bgView.tag = 123123
        bgView.backgroundColor = color
        bgView.isUserInteractionEnabled = false
        bgView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(bgView, at: 0)
        bgView.layer.zPosition = -1
    }
}
