//
//  MainVC.swift
//  CheckPlease
//
//  Created by Aleksandr Smorodov on 14.05.2021.
//  

import UIKit

protocol MainDisplayLogic: class {
    
}

class MainVC: BaseViewController {
    
    var interactor: MainBusinessLogic?
    var router: MainRoutingLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func style() {
        super.style()
        
    }
    
    override func fill() {
        super.fill()
        
    }
}

extension MainVC: MainDisplayLogic {
    
}
