//
//  RegisterConfigurator.swift
//  Sports.kg
//
//  Created Eldiiar on 18/10/22.
//

import Foundation

protocol RegisterConfiguratorProtocol: AnyObject {
    func configure(with viewController: RegisterViewController)
}

class RegisterConfigurator: RegisterConfiguratorProtocol {
    
    func configure(with viewController: RegisterViewController) {
        let presenter = RegisterPresenter(view: viewController)
        let interactor = RegisterInteractor(presenter: presenter)
        let router = RegisterRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}

