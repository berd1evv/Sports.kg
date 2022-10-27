//
//  SliderConfigurator.swift
//  Sports.kg
//
//  Created Eldiiar on 15/10/22.
//

import Foundation

protocol SliderConfiguratorProtocol: AnyObject {
    func configure(with viewController: SliderViewController)
}

class SliderConfigurator: SliderConfiguratorProtocol {
    
    func configure(with viewController: SliderViewController) {
        let presenter = SliderPresenter(view: viewController)
        let interactor = SliderInteractor(presenter: presenter)
        let router = SliderRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}

