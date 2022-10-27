//
//  RegisterRouter.swift
//  Sports.kg
//
//  Created Eldiiar on 18/10/22.
//

import Foundation

protocol RegisterRouterProtocol: AnyObject {
    
}

class RegisterRouter {

    weak var viewController: RegisterViewController!
    
    init(viewController: RegisterViewController) {
        self.viewController = viewController
    }
    
}

extension RegisterRouter: RegisterRouterProtocol {
    
}
