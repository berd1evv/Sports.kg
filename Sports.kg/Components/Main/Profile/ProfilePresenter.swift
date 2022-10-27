//
//  ProfilePresenter.swift
//  Sports.kg
//
//  Created Eldiiar on 9/10/22.
//

import Foundation

protocol ProfilePresenterProtocol: AnyObject {
    func getUserInfo()
    
    var model: Register? { get }
}

class ProfilePresenter {
    
    var model: Register?
    
    weak var view: ProfileViewProtocol!
    var interactor: ProfileInteractorProtocol!
    var router: ProfileRouterProtocol!

    required init(view: ProfileViewProtocol!) {
        self.view = view
    }
}

// MARK: - ProfilePresenterProtocol
extension ProfilePresenter: ProfilePresenterProtocol {
    func getUserInfo() {
        interactor.fetchUserInfo()
    }
}

// MARK: - ProfileInteractorOutputProtocol
extension ProfilePresenter: ProfileInteractorOutputProtocol {
    func didRecieveUserInfo(_ model: Register) {
        self.model = model
        view.setData()
    }
}
