//
//  ExtS+UIFont.swift
//  CheckPlease
//
//  Created by Aleksandr Smorodov on 14.05.2021.
//

import UIKit

extension UIFont {
    
    static var body: UIFont { Style.system.font(ofSize: 14, weight: .regular)}
    static var caption: UIFont { Style.system.font(ofSize: 12, weight: .regular)}
    
    static var amountInt: UIFont { Style.system.font(ofSize: 30, weight: .heavy)}
    static var amountFractions: UIFont { Style.system.font(ofSize: 25, weight: .bold)}
    static var amountRub: UIFont { Style.system.font(ofSize: 25, weight: .ultraLight)}
}

extension UIFont {
    
    enum Style {
        
        case system
        
        func name(ofWeight weight: Weight) -> String? {
            switch self {
            default:
                return nil
            }
        }
        
        func font(ofSize size: CGFloat, weight: Weight) -> UIFont {
            switch self {
            case .system:
                break
            }
            return UIFont.systemFont(ofSize: size, weight: weight)
        }
    }
}

extension UIFont {
    
    class func printFamilyNames() {
        for name in UIFont.familyNames {
            print(name)
            if let nameString = name as String? {
                print(UIFont.fontNames(forFamilyName: nameString))
            }
        }
    }
}
