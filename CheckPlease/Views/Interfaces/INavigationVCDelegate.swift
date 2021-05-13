//
//  INavigationVCDelegate.swift
//  CheckPlease
//
//  Created by Aleksandr Smorodov on 14.05.2021.
//

import UIKit

protocol INavigationVCDelegate: UIViewController {
    
    var isSwipeBackEnabled: Bool { get }
}
