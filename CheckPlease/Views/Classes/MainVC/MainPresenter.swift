//
//  MainPresenter.swift
//  CheckPlease
//
//  Created by Aleksandr Smorodov on 14.05.2021.
//

import Foundation

protocol MainPresentationLogic: AnyObject {
    
    func updatePositions(_ positions: [Position]?)
}

final class MainPresenter: MainPresentationLogic {
    
    weak var viewController: MainDisplayLogic?
    
    
    func updatePositions(_ positions: [Position]?) {
        viewController?.updatePositions(positions)
    }
}
