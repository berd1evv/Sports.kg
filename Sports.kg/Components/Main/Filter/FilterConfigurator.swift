//
//  FilterConfigurator.swift
//  Sports.kg
//
//  Created Eldiiar on 19/10/22.
//

import Foundation

protocol FilterConfiguratorProtocol: AnyObject {
    func configure(with viewController: FilterViewController)
}

class FilterConfigurator: FilterConfiguratorProtocol {
    
    func configure(with viewController: FilterViewController) {
        let presenter = FilterPresenter(view: viewController)
        let interactor = FilterInteractor(presenter: presenter)
        let router = FilterRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}

