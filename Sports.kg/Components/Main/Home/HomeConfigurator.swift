//
//  HomeConfigurator.swift
//  Sports.kg
//
//  Created Eldiiar on 4/10/22.
//

import Foundation

protocol HomeConfiguratorProtocol: AnyObject {
    func configure(with viewController: HomeViewController)
}

class HomeConfigurator: HomeConfiguratorProtocol {
    
    func configure(with viewController: HomeViewController) {
        let presenter = HomePresenter(view: viewController)
        let interactor = HomeInteractor(presenter: presenter)
        let router = HomeRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}

