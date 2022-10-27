//
//  MapDetailsRouter.swift
//  Sports.kg
//
//  Created Eldiiar on 24/10/22.
//

import Foundation

protocol MapDetailsRouterProtocol: AnyObject {
    func showDetails(id: Int)
}

class MapDetailsRouter {

    weak var viewController: MapDetailsViewController!
    weak var view: MapViewController!
    
    init(viewController: MapDetailsViewController) {
        self.viewController = viewController
    }
    
}

extension MapDetailsRouter: MapDetailsRouterProtocol {
    func showDetails(id: Int) {
        let vc = DetailsViewController()
        let configurator: DetailsConfiguratorProtocol = DetailsConfigurator()
        configurator.configure(with: vc, with: id)
        viewController.modalPresentationStyle = .overFullScreen
        viewController.present(vc, animated: true)
    }
}
