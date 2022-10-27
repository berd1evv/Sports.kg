//
//  FilterRouter.swift
//  Sports.kg
//
//  Created Eldiiar on 19/10/22.
//

import Foundation

protocol FilterRouterProtocol: AnyObject {
    
}

class FilterRouter {

    weak var viewController: FilterViewController!
    
    init(viewController: FilterViewController) {
        self.viewController = viewController
    }
    
}

extension FilterRouter: FilterRouterProtocol {
    
}
