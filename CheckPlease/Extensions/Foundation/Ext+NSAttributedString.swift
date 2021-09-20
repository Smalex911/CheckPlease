//
//  Ext+NSAttributedString.swift
//  CheckPlease
//
//  Created by Aleksandr Smorodov on 18.05.2021.
//

import UIKit

struct TextAttribute {
    
    var text: String
    var color: UIColor?
    var font: UIFont?
    var alignment: NSTextAlignment
    var link: String?
    var lineSpacing: CGFloat?
    var lineHeight: CGFloat?
    var strikethrough: Int?
    var underline: Int?
    var ignoreLetterCase: Bool
    
    init(text: String, color: UIColor? = nil, font: UIFont? = nil, alignment: NSTextAlignment = .left, link: String? = nil, lineSpacing: CGFloat? = nil, lineHeight: CGFloat? = nil, strikethrough: Int? = nil, underline: Int? = nil, ignoreLetterCase: Bool = false) {
        
        self.text = text
        self.color = color
        self.font = font
        self.alignment = alignment
        self.link = link
        self.lineSpacing = lineSpacing
        self.lineHeight = lineHeight
        self.strikethrough = strikethrough
        self.underline = underline
        self.ignoreLetterCase = ignoreLetterCase
        
    }
    
    init(text: String, color: UIColor? = nil, font: UIFont? = nil, alignment: NSTextAlignment = .left, link: String? = nil, lineSpacing: CGFloat? = nil, lineHeight: CGFloat? = nil, strikethrough: Int? = nil, underline: NSUnderlineStyle?, ignoreLetterCase: Bool = false) {
        
        self.text = text
        self.color = color
        self.font = font
        self.alignment = alignment
        self.link = link
        self.lineSpacing = lineSpacing
        self.lineHeight = lineHeight
        self.strikethrough = strikethrough
        self.underline = underline?.rawValue
        self.ignoreLetterCase = ignoreLetterCase
        
    }
}

extension NSAttributedString {
    
    @discardableResult
    static func textWithAttribute(_ attr: TextAttribute, attrString: NSMutableAttributedString? = nil) -> NSMutableAttributedString {
        
        var attributedString: NSMutableAttributedString!
        
        var range = NSMakeRange(0, attr.text.count)
        
        if let str = attrString {
            let nsString = NSString(string: attr.ignoreLetterCase ? str.string.lowercased() : str.string)
            range = nsString.range(of: attr.ignoreLetterCase ? attr.text.lowercased() : attr.text)
            attributedString = str
        } else {
            attributedString = NSMutableAttributedString(string: attr.text)
        }
        
        if let font = attr.font {
            attributedString.addAttribute(.font, value: font, range: range)
        }
        if let color = attr.color {
            attributedString.addAttribute(.foregroundColor, value: color, range: range)
        }
        
        if attrString == nil {
            let paragraph = NSMutableParagraphStyle()
            paragraph.alignment = attr.alignment
            if let lineSpacing = attr.lineSpacing, let font = attr.font {
                paragraph.lineSpacing = lineSpacing - (font.lineHeight - font.pointSize)
            }
            if let lineHeight = attr.lineHeight {
                paragraph.minimumLineHeight = lineHeight
            }
            attributedString.addAttribute(.paragraphStyle, value: paragraph, range: range)
        }
        if let link = attr.link {
            attributedString.addAttribute(.link, value: link, range: range)
        }
        if let strikethrough = attr.strikethrough {
            attributedString.addAttribute(.strikethroughStyle, value: strikethrough, range: range)
        }
        if let underline = attr.underline {
            attributedString.addAttribute(.underlineStyle, value: underline, range: range)
        }
        
        return attributedString
        
    }
    
}
