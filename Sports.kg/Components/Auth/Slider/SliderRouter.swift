//
//  SliderRouter.swift
//  Sports.kg
//
//  Created Eldiiar on 15/10/22.
//

import Foundation

protocol SliderRouterProtocol: AnyObject {
    
}

class SliderRouter {

    weak var viewController: SliderViewController!
    
    init(viewController: SliderViewController) {
        self.viewController = viewController
    }
    
}

extension SliderRouter: SliderRouterProtocol {
    
}
