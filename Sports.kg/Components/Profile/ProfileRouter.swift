//
//  ProfileRouter.swift
//  Sports.kg
//
//  Created Eldiiar on 9/10/22.
//

import Foundation

protocol ProfileRouterProtocol: AnyObject {
    
}

class ProfileRouter {

    weak var viewController: ProfileViewController!
    
    init(viewController: ProfileViewController) {
        self.viewController = viewController
    }
    
}

extension ProfileRouter: ProfileRouterProtocol {
    
}
