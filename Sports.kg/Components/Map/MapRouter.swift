//
//  MapRouter.swift
//  Sports.kg
//
//  Created Eldiiar on 9/10/22.
//

import Foundation

protocol MapRouterProtocol: AnyObject {
    
}

class MapRouter {

    weak var viewController: MapViewController!
    
    init(viewController: MapViewController) {
        self.viewController = viewController
    }
    
}

extension MapRouter: MapRouterProtocol {
    
}
