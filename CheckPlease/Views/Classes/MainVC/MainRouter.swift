//
//  MainRouter.swift
//  CheckPlease
//
//  Created by Aleksandr Smorodov on 14.05.2021.
//

import Foundation
import ViRouting

protocol MainRoutingLogic {
    
    func openMain()
}

extension MainRoutingLogic where Self: Router {

    func openMain() {
        
        let interactor = MainInteractor()
        let presenter = MainPresenter()
        let router = MainRouter(rootTransition: EmptyViewTransition())
        
        let viewController = MainVC.extractNib()
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        
        viewController.swapRoot()
    }
}

final class MainRouter: BaseRouter {
    
}
