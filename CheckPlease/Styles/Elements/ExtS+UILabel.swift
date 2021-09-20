//
//  ExtS+UILabel.swift
//  CheckPlease
//
//  Created by Aleksandr Smorodov on 18.05.2021.
//

import UIKit

enum NumberOfLines: Int {
    case one = 1
    case two = 2
    case three = 3
    case five = 5
    case many = 0
}

//MARK: - Basic Style Methods
extension UILabel {
    
    func style(_ text: String? = nil, font: UIFont, color: UIColor = .text, alignment: NSTextAlignment = .left, lines: NumberOfLines = .one)  {
        self.text = text
        self.font = font
        textColor = color
        textAlignment = alignment
        numberOfLines = lines.rawValue
    }
    
    func styleAttr(_ attr: TextAttribute, subAttr: [TextAttribute] = [], lines: NumberOfLines = .many) {
        let attributedString = NSAttributedString.textWithAttribute(attr)
        
        subAttr.forEach {
            NSAttributedString.textWithAttribute($0, attrString: attributedString)
        }
        
        numberOfLines = lines.rawValue
        attributedText = attributedString
    }
}
