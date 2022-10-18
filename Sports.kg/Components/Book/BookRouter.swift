//
//  BookRouter.swift
//  Sports.kg
//
//  Created Eldiiar on 15/10/22.
//

import Foundation

protocol BookRouterProtocol: AnyObject {
    
}

class BookRouter {

    weak var viewController: BookViewController!
    
    init(viewController: BookViewController) {
        self.viewController = viewController
    }
    
}

extension BookRouter: BookRouterProtocol {
    
}
