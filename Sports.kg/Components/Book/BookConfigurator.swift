//
//  BookConfigurator.swift
//  Sports.kg
//
//  Created Eldiiar on 15/10/22.
//

import Foundation

protocol BookConfiguratorProtocol: AnyObject {
    func configure(with viewController: BookViewController)
}

class BookConfigurator: BookConfiguratorProtocol {
    
    func configure(with viewController: BookViewController) {
        let presenter = BookPresenter(view: viewController)
        let interactor = BookInteractor(presenter: presenter)
        let router = BookRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}

