//
//  ProfilePresenter.swift
//  Sports.kg
//
//  Created Eldiiar on 9/10/22.
//

import Foundation

protocol ProfilePresenterProtocol: AnyObject {
    
}

class ProfilePresenter {
    
    weak var view: ProfileViewProtocol!
    var interactor: ProfileInteractorProtocol!
    var router: ProfileRouterProtocol!

    required init(view: ProfileViewProtocol!) {
        self.view = view
    }
}

// MARK: - ProfilePresenterProtocol
extension ProfilePresenter: ProfilePresenterProtocol {
    
}

// MARK: - ProfileInteractorOutputProtocol
extension ProfilePresenter: ProfileInteractorOutputProtocol {
    
}
