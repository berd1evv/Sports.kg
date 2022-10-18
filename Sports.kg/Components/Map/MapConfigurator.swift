//
//  MapConfigurator.swift
//  Sports.kg
//
//  Created Eldiiar on 9/10/22.
//

import Foundation

protocol MapConfiguratorProtocol: AnyObject {
    func configure(with viewController: MapViewController)
}

class MapConfigurator: MapConfiguratorProtocol {
    
    func configure(with viewController: MapViewController) {
        let presenter = MapPresenter(view: viewController)
        let interactor = MapInteractor(presenter: presenter)
        let router = MapRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}

