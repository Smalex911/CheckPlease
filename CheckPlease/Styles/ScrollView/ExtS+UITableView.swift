//
//  ExtS+UITableView.swift
//  CheckPlease
//
//  Created by Aleksandr Smorodov on 18.05.2021.
//

import UIKit

extension UITableView {
    
    override func styleClear() {
        styleClear(contentInset: .zero)
    }
    
    func styleClear(contentInset: UIEdgeInsets) {
        super.styleClear()
        
        self.contentInset = contentInset
        scrollIndicatorInsets = contentInset
        separatorStyle = .none
        
        clipsToBounds = true
    }
}
