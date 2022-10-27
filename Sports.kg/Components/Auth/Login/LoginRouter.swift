//
//  LoginRouter.swift
//  Sports.kg
//
//  Created Eldiiar on 18/10/22.
//

import Foundation

protocol LoginRouterProtocol: AnyObject {
    func loginingIn()
}

class LoginRouter {

    weak var viewController: LoginViewController!
    
    init(viewController: LoginViewController) {
        self.viewController = viewController
    }
    
}

extension LoginRouter: LoginRouterProtocol {
    func loginingIn() {
        //let vc = HomeViewController()
        let tabBar = TabBarViewController()
        
        viewController.navigationController?.pushViewController(tabBar, animated: true)
    }
}
