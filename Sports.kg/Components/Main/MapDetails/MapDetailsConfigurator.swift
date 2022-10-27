//
//  MapDetailsConfigurator.swift
//  Sports.kg
//
//  Created Eldiiar on 24/10/22.
//

import Foundation

protocol MapDetailsConfiguratorProtocol: AnyObject {
    func configure(with viewController: MapDetailsViewController, with model: Map)
}

class MapDetailsConfigurator: MapDetailsConfiguratorProtocol {
    
    func configure(with viewController: MapDetailsViewController, with model: Map) {
        let presenter = MapDetailsPresenter(view: viewController)
        let interactor = MapDetailsInteractor(presenter: presenter, with: model)
        let router = MapDetailsRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}

