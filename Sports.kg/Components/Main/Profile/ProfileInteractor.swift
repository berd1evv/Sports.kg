//
//  ProfileInteractor.swift
//  Sports.kg
//
//  Created Eldiiar on 9/10/22.
//

import Foundation

protocol ProfileInteractorProtocol: AnyObject {
    func fetchUserInfo()
}

protocol ProfileInteractorOutputProtocol: AnyObject {
    func didRecieveUserInfo(_ model: Register)
}

class ProfileInteractor {
    
    weak var presenter: ProfileInteractorOutputProtocol!
    let networkService = NetworkService.shared
    
    required init(presenter: ProfileInteractorOutputProtocol!) {
        self.presenter = presenter
    }
    
}

extension ProfileInteractor: ProfileInteractorProtocol {
    func fetchUserInfo() {
        networkService.sendRequest(urlRequest: ProfileeRouter.getUser.createURLRequest(), successModel: Register.self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                print(model)
                self.presenter.didRecieveUserInfo(model)
            case .badRequest(let error):
                debugPrint(#function, error)
            case .failure(let error):
                debugPrint(#function, error)
            case .unauthorized(let error):
                debugPrint(#function, error)
            case .notFound(let error):
                debugPrint(#function, error)
            }
        }
    }
    
}

