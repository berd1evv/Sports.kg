//
//  LoginPresenter.swift
//  Sports.kg
//
//  Created Eldiiar on 18/10/22.
//

import Foundation

protocol LoginPresenterProtocol: AnyObject {
    func login(userName: String, password: String)
}

class LoginPresenter {
    
    weak var view: LoginViewProtocol!
    var interactor: LoginInteractorProtocol!
    var router: LoginRouterProtocol!

    required init(view: LoginViewProtocol!) {
        self.view = view
    }
}

// MARK: - LoginPresenterProtocol
extension LoginPresenter: LoginPresenterProtocol {
    func login(userName: String, password: String) {
        interactor.login(userName: userName, password: password)
    }
}

// MARK: - LoginInteractorOutputProtocol
extension LoginPresenter: LoginInteractorOutputProtocol {
    func didSignInSuccessfully() {
        router.loginingIn()
    }
}
