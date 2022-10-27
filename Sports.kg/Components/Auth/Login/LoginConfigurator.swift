//
//  LoginConfigurator.swift
//  Sports.kg
//
//  Created Eldiiar on 18/10/22.
//

import Foundation

protocol LoginConfiguratorProtocol: AnyObject {
    func configure(with viewController: LoginViewController)
}

class LoginConfigurator: LoginConfiguratorProtocol {
    
    func configure(with viewController: LoginViewController) {
        let presenter = LoginPresenter(view: viewController)
        let interactor = LoginInteractor(presenter: presenter)
        let router = LoginRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}

