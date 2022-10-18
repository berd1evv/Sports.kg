//
//  ProfileConfigurator.swift
//  Sports.kg
//
//  Created Eldiiar on 9/10/22.
//

import Foundation

protocol ProfileConfiguratorProtocol: AnyObject {
    func configure(with viewController: ProfileViewController)
}

class ProfileConfigurator: ProfileConfiguratorProtocol {
    
    func configure(with viewController: ProfileViewController) {
        let presenter = ProfilePresenter(view: viewController)
        let interactor = ProfileInteractor(presenter: presenter)
        let router = ProfileRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}

