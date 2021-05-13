//
//  Ext+UIResponder.swift
//  CheckPlease
//
//  Created by Aleksandr Smorodov on 14.05.2021.
//

import UIKit

extension UIResponder {
    
    ///Initiation with loading
    static func instantiateFromNib() -> Self? {
        let name = description().components(separatedBy: ".").last!
        
        guard Bundle.main.path(forResource: name, ofType: "nib") != nil else {
            return nil
        }
        
        return UINib(nibName: name, bundle: nil).instantiate(withOwner: nil, options: nil).first as? Self
    }
}
