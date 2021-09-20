//
//  ExtS+UIView.swift
//  CheckPlease
//
//  Created by Aleksandr Smorodov on 17.05.2021.
//

import UIKit

extension UIView {
    
    func styleRounded(cornerRadius: CGFloat? = nil) {
        layer.cornerRadius = cornerRadius ?? frame.height / 2
        layer.masksToBounds = false
    }
    
    func styleRoundedCard(cornerRadius: CGFloat? = 6) {
        styleRounded(cornerRadius: cornerRadius)
    }
    
    func styleShadowCard() {
        styleShadow(color: UIColor.black, radius: 15, offset: .init(width: 2, height: 2), opacity: 0.03)
    }
    
    func styleShadowButton() {
        styleShadow(color: UIColor.black, radius: 20, offset: .init(width: 0, height: 4), opacity: 0.3)
    }
    
    func styleShadow(color: UIColor, radius: CGFloat, offset: CGSize, opacity: Float) {
        
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
    }
    
    func styleBorder(_ width: CGFloat = 1, color: UIColor = .primary) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
}
