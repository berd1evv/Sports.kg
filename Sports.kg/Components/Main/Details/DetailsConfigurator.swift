//
//  DetailsConfigurator.swift
//  Sports.kg
//
//  Created Eldiiar on 9/10/22.
//

import Foundation

protocol DetailsConfiguratorProtocol: AnyObject {
    func configure(with viewController: DetailsViewController, with id: Int)
}

class DetailsConfigurator: DetailsConfiguratorProtocol {
    
    func configure(with viewController: DetailsViewController, with id: Int) {
        let presenter = DetailsPresenter(view: viewController)
        let interactor = DetailsInteractor(presenter: presenter, id: id)
        let router = DetailsRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}

