//
//  TapScaleView.swift
//  CheckPlease
//
//  Created by Aleksandr Smorodov on 18.05.2021.
//

import UIKit

class TapScaleView: ExtendedHitView {
    
    @IBInspectable var scaleValue: CGFloat = 0.95
    @IBInspectable var scaleDuration: Double = 0.15
    
    var isEnabled: Bool = true
    
    var didTap: (() -> Void)?
    
    var outBoundsTouchOffset: CGFloat = 50
    var isScaled: Bool = false
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        guard isEnabled else { return }
        scale(startValue: 1.0, endValue: scaleValue)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        guard isEnabled else { return }
        
        if let point = touches.first?.location(in: self) {
            if isInAvailableArea(point: point) {
                scale(startValue: 1.0, endValue: scaleValue)
            } else {
                scale(startValue: scaleValue, endValue: 1.0)
            }
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        guard isEnabled else { return }
        scale(startValue: scaleValue, endValue: 1.0)
        
        if let point = touches.first?.location(in: self), isInAvailableArea(point: point) {
            didTap?()
        }
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        
        guard isEnabled else { return }
        scale(startValue: scaleValue, endValue: 1.0)
    }
    
    private func isInAvailableArea(point: CGPoint) -> Bool {
        let rect = bounds.insetBy(dx: 0 - outBoundsTouchOffset, dy: 0 - outBoundsTouchOffset)
        return rect.contains(point)
    }
    
    private func scale(startValue: CGFloat, endValue: CGFloat) {
        guard isScaled != (endValue != 1) else { return }
        
        isScaled = endValue != 1
        
        DispatchQueue.main.async {
            self.transform = CGAffineTransform.identity.scaledBy(x: startValue, y: startValue)
            
            UIView.animate(withDuration: self.scaleDuration, delay: 0.0, options: .curveLinear, animations: {
                self.transform = CGAffineTransform.identity.scaledBy(x: endValue, y: endValue)
            })
        }
    }
}
