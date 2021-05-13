//
//  Ext+UIImage.swift
//  CheckPlease
//
//  Created by Aleksandr Smorodov on 14.05.2021.
//

import UIKit

extension UIImage {
    
    static func origImg(_ name: String) -> UIImage? {
        UIImage(named: name)?.withRenderingMode(.alwaysOriginal)
    }
    static func tempImg(_ name: String) -> UIImage? {
        UIImage(named: name)?.withRenderingMode(.alwaysTemplate)
    }
    static func img(_ name: String) -> UIImage? {
        UIImage(named: name)
    }
    
    static func tileImg(_ name: String) -> UIImage? {
        origImg(name)?.resizableImage(withCapInsets: .zero, resizingMode: .tile)
    }
    
    static func stretchImg(_ name: String, insets: UIEdgeInsets, isOrig: Bool = true) -> UIImage? {
        guard let image = isOrig ? origImg(name) : tempImg(name) else { return nil}
        return image.resizableImage(withCapInsets: insets, resizingMode: .stretch)
    }
    
    convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}

extension CIImage {
    
    var uiImage: UIImage {
        UIImage(ciImage: self)
    }
}
