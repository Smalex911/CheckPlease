//
//  BaseViewController.swift
//  CheckPlease
//
//  Created by Aleksandr Smorodov on 14.05.2021.
//

import UIKit

class BaseViewController: AViewController {
    
    override func initBackBarButton() -> UIBarButtonItem? {
        .init(title: "Назад", style: .plain, target: self, action: #selector(pushBack))
    }
    
    override func initCloseBarButton() -> UIBarButtonItem? {
        .init(title: "Отменить", style: .plain, target: self, action: #selector(close))
    }
    
    override func styleNavigationBar() {
        navigationController?.styleNavbar(hidden: hiddenNavBar, isTranslucent: isTranslucentNavBar)
    }
}
