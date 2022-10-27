//
//  RegisterPresenter.swift
//  Sports.kg
//
//  Created Eldiiar on 18/10/22.
//

import Foundation

protocol RegisterPresenterProtocol: AnyObject {
    
}

class RegisterPresenter {
    
    weak var view: RegisterViewProtocol!
    var interactor: RegisterInteractorProtocol!
    var router: RegisterRouterProtocol!

    required init(view: RegisterViewProtocol!) {
        self.view = view
    }
}

// MARK: - RegisterPresenterProtocol
extension RegisterPresenter: RegisterPresenterProtocol {
    
}

// MARK: - RegisterInteractorOutputProtocol
extension RegisterPresenter: RegisterInteractorOutputProtocol {
    
}
