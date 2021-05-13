//
//  MainInteractor.swift
//  CheckPlease
//
//  Created by Aleksandr Smorodov on 14.05.2021.
//

import Foundation

protocol MainBusinessLogic {
    
    var presenter: MainPresentationLogic? { get }
}

final class MainInteractor: MainBusinessLogic {
    
    var presenter: MainPresentationLogic?
}
