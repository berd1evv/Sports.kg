//
//  HomeRouter.swift
//  Sports.kg
//
//  Created Eldiiar on 4/10/22.
//

import Foundation

protocol HomeRouterProtocol: AnyObject {
    func showDetails(id: Int)
}

class HomeRouter {

    weak var viewController: HomeViewController!
    
    init(viewController: HomeViewController) {
        self.viewController = viewController
    }
    
}

extension HomeRouter: HomeRouterProtocol {
    func showDetails(id: Int) {
        let vc = DetailsViewController()
        let configurator: DetailsConfiguratorProtocol = DetailsConfigurator()
        configurator.configure(with: vc, with: id)
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}
