//
//  DetailsRouter.swift
//  Sports.kg
//
//  Created Eldiiar on 9/10/22.
//

import Foundation

protocol DetailsRouterProtocol: AnyObject {
    
}

class DetailsRouter {

    weak var viewController: DetailsViewController!
    
    init(viewController: DetailsViewController) {
        self.viewController = viewController
    }
    
}

extension DetailsRouter: DetailsRouterProtocol {
    
}
