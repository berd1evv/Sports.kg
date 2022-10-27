//
//  RegisterInteractor.swift
//  Sports.kg
//
//  Created Eldiiar on 18/10/22.
//

import Foundation

protocol RegisterInteractorProtocol: AnyObject {
    func register(email: String, username: String, password: String)
}

protocol RegisterInteractorOutputProtocol: AnyObject {
    
}

class RegisterInteractor {
    
    weak var presenter: RegisterInteractorOutputProtocol!
    let networkService = NetworkService.shared
    
    required init(presenter: RegisterInteractorOutputProtocol!) {
        self.presenter = presenter
    }
    
}

extension RegisterInteractor: RegisterInteractorProtocol {
    func register(email: String, username: String, password: String) {
        let parameters: [String : Any] = [
            "email" : email,
            "username" : username,
            "password" : password
        ]
        let data = try? JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        guard let data = data else {
            return
        }
        networkService.sendRequest(urlRequest: AuthRouter.register(data: data).createURLRequest(), successModel: Register.self) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let model):
                print(model)
                UserDefaultsService.shared.saveUserInfo(email: model.email ?? "", username: model.username ?? "", id: model.id ?? 0)
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

