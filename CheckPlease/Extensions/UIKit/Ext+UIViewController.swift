//
//  Ext+UIViewController.swift
//  CheckPlease
//
//  Created by Aleksandr Smorodov on 14.05.2021.
//

import UIKit

extension UIViewController {
    
    ///Initiation without loading
    static func initializeFromNib() -> Self? {
        let name = description().components(separatedBy: ".").last!
        
        guard Bundle.main.path(forResource: name, ofType: "nib") != nil else {
            return nil
        }
        
        return .init(nibName: name, bundle: nil)
    }
}

