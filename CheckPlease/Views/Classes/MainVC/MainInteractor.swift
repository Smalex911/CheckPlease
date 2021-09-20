//
//  MainInteractor.swift
//  CheckPlease
//
//  Created by Aleksandr Smorodov on 14.05.2021.
//

import Foundation

protocol MainBusinessLogic {
    
    var presenter: MainPresentationLogic? { get }
    
    func fetchPositions()
}

final class MainInteractor: MainBusinessLogic {
    
    var presenter: MainPresentationLogic?
    
    func fetchPositions() {
        let positions: [Position] = [.mockShort, .mockLong].repeated(count: 5)
        
        presenter?.updatePositions(positions)
    }
}
