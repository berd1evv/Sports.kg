//
//  MapRouter.swift
//  Sports.kg
//
//  Created Eldiiar on 9/10/22.
//

import UIKit

protocol MapRouterProtocol: AnyObject {
    func showDetails(location: Map)
}

class MapRouter {

    weak var viewController: MapViewController!
    
    init(viewController: MapViewController) {
        self.viewController = viewController
    }
    
}

extension MapRouter: MapRouterProtocol {
    func showDetails(location: Map) {
        let configurator: MapDetailsConfiguratorProtocol = MapDetailsConfigurator()
        let vc = MapDetailsViewController()
        configurator.configure(with: vc, with: location)
        if let presentationController = vc.presentationController as? UISheetPresentationController {
            presentationController.detents = [.medium()]
        }
        viewController.present(vc, animated: true)
    }
}
