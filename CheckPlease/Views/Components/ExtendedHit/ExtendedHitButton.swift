//
//  ExtendedHitButton.swift
//  CheckPlease
//
//  Created by Aleksandr Smorodov on 17.05.2021.
//

import UIKit

class ExtendedHitButton: UIButton {
    
    var touchAreaPadding: UIEdgeInsets?
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        
        guard let insets = touchAreaPadding else {
            return super.point(inside: point, with: event)
        }
        
        let rect = bounds.inset(by: insets.inverted())
        return rect.contains(point)
    }
}
