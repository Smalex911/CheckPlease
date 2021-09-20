//
//  ExtS+UIScrollView.swift
//  CheckPlease
//
//  Created by Aleksandr Smorodov on 18.05.2021.
//

import UIKit

extension UIScrollView {
    
    @objc func styleClear() {
        backgroundColor = .clear
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = true
        alwaysBounceVertical = true
    }
}
